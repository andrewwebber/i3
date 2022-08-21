local popup = require "popup"
local Job = require "plenary.job"
local curl = require "plenary.curl"

local M = {}

local show_issues = function(issues)
    local _issues = {}
    for _, v in pairs(issues) do
        table.insert(_issues, v.title)
    end

    local buffer = vim.api.nvim_buf_get_name(0)
    local r, c = vim.api.nvim_win_get_cursor(0)
    -- nvim get buf line
    popup.create(_issues, {
        line = "cursor+2",
        col = "cursor+2",
        border = { 1, 1, 1, 1 },
        enter = true,
        cursorline = true,
        callback = function(_, sel)
            for _, v in pairs(issues) do
                if v.title == sel then
                    print(v.id)
                    -- local line = vim.api.nvim_buf_get_lines(0, start, end, false)
                    vim.api.nvim_buf_set_text(buffer, r, c, r, 10, { v.id })
                    -- nvim_buf_set_text
                    return
                end
            end
        end,
    })
end

M.gitlab_issues = function()
    if M._issues then
        show_issues(M._issues)
        return
    end

    local token = {}
    local job = Job:new {
        command = "pass",
        args = { "gitlab.com/tokens/personal" },
        on_stdout = function(_, line)
            token = line
        end,
    }
    job:sync()

    local username = {}
    local file = "https://gitlab.com/api/v4/user"

    local headers = {}
    headers["PRIVATE-TOKEN"] = token
    local res = curl.get(file, { headers = headers })
    if res then
        local body = res.body
        if body then
            local body_json = vim.json.decode(body)
            username = body_json.username
            print(vim.inspect.inspect(username))
        end
    end

    local issues = {}
    file = string.format("https://gitlab.com/api/v4/issues?state=opened&scope=all&assignee_username=%s", username)
    res = curl.get(file, { headers = headers })
    if res then
        local body = res.body
        if body then
            local body_json = vim.json.decode(body)
            for _, issue in pairs(body_json) do
                if issue.assignees then
                    for _, assigne in pairs(issue.assignees) do
                        if assigne.username then
                            if assigne.username == username then
                                table.insert(issues, { title = issue.title, id = issue.web_url })
                                goto continue
                            end
                        end
                    end
                end
                if issue.assigne then
                    if issue.assigne.username == username then
                        table.insert(issues, { title = issue.title, id = issue.web_url })
                    end
                end
                ::continue::
            end
        end
    end

    M._issues = issues
    show_issues(M._issues)
end

vim.keymap.set('n', '<C-g>', ':lua require"example".gitlab_issues()<CR>')
return M
