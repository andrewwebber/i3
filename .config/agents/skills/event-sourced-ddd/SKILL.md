---
name: event-sourced-ddd
description: Design, implement, migrate, or review durable business behavior using DDD, CQRS, and event sourcing. Use for aggregates, commands, events, projections, event stores, schema evolution, replays, consumers, and integrations; use cqrs-es for Rust unless an approved exception exists.
---

# Event-Sourced DDD Workflow

## Purpose

Use this skill whenever durable business behavior changes. Event streams are the source of truth; projections, tables, caches, and indexes are derived read models.

Do not use this workflow for purely ephemeral UI state, static reference data with no business-history value, or operational metadata unless the user requests event sourcing for them too.

## 1. Discover the domain first

Before editing code, identify:

- the bounded context and ubiquitous-language terms;
- the aggregate that owns the invariant and its stream identity;
- commands, their authorized actor, and rejection cases;
- events expressed as immutable, past-tense facts;
- required projections and their query consumers;
- cross-aggregate processes, integrations, and external side effects;
- existing events, schemas, projections, streams, contracts, and historical data that must remain compatible.

Read existing DDD/domain documentation first. If it is missing or insufficient, create or update a lightweight design artifact for review containing those items. It may be created with the first thin implementation slice, but review is required before completion.

Do not begin from a database schema, HTTP route, UI state, or ORM entity. Those are adapters around the domain model.

## 2. Establish aggregate boundaries

- A command is evaluated by one aggregate/stream under optimistic concurrency.
- The aggregate owns the invariants that need immediate consistency.
- Validate a command against state rebuilt from events, then emit zero or more new events.
- Apply events to evolve aggregate state. Do not directly mutate durable business state in command handlers.
- Coordinate cross-aggregate work through events, policies/process managers, or sagas. Do not hide distributed transactions behind synchronous calls.
- Use explicit typed domain errors for rejected commands.

## 3. Design durable event contracts

Events are permanent historical facts.

- Use unambiguous past-tense names, such as `SubscriptionActivated`, `MemberRemoved`, or `InvoicePaid`.
- Include only data that was true at the time the event occurred and is necessary for reconstruction or consumers.
- Assign stable event type names and schema versions.
- Never change an event's meaning, reuse an event name, or mutate an existing historical record.
- Prefer CloudEvents v1.0 structure or a documented compatible mapping where practical. Preserve, where applicable:
  - unique event ID;
  - source, aggregate/stream type, and stream ID;
  - event type and schema version;
  - stream version or sequence;
  - occurrence time;
  - correlation and causation IDs;
  - safe actor, tenant, and request context.
- Do not emit passwords, secrets, bearer tokens, private keys, raw payment data, session material, or directly identifying sensitive data. Use opaque identifiers or a separately governed encrypted store when needed.

## 4. Evolve schemas safely

Before changing events or persisted projections:

1. Identify all historical versions and all producers/consumers.
2. Prefer additive optional fields with safe defaults.
3. Write explicit upcasters, migration adapters, or compatibility deserializers for incompatible representation changes.
4. Define a projection rebuild and rollout plan.
5. Test representative historical payloads and complete stream replay.

Do not rename, remove, reinterpret, or make required a persisted/public field without an approved compatibility plan. Never rewrite production event history as an ordinary migration.

## 5. Build projections and consumers

- Projections must be deterministic, replay-safe, and derive their data only from events.
- A projection must be disposable: clearing it and replaying the complete stream must produce the correct state.
- Snapshots are allowed only as replay optimizations. They must be disposable and derivable from the full stream.
- Assume at-least-once delivery. Make consumers idempotent using stable event identity, consumer position, or an equivalent durable deduplication key.
- Dispatch external effects using durable outbox/dispatch tracking or an equivalent recoverable mechanism.
- Keep external effects outside aggregate decision logic; trigger them from facts and make retries safe.
- Never repair domain state through direct projection writes except through a documented rebuild or migration procedure.

## 6. Rust implementation guidance

When the target is Rust, use `cqrs-es` unless the user approves a documented exception.

For each aggregate, normally provide:

- a serializable command enum;
- a serializable, versioned event enum implementing the required domain-event mapping;
- aggregate command handling that validates invariants and emits events;
- event application as the sole state transition mechanism;
- deterministic `View` projections and a persistence/query wiring layer;
- typed error handling without `unwrap` or `expect` in production paths.

Use the framework's aggregate test facilities for decision logic. Keep framework, transport, database, and HTTP code outside core domain decisions.

## 7. Test and verify

Every changed business behavior needs all applicable tests:

1. **Command-to-events:** valid commands emit exactly the intended facts; rejected commands emit none.
2. **Aggregate replay:** state rebuilds correctly from historical and newly emitted streams, including relevant schema versions.
3. **Projection/consumer:** projections are deterministic and replay-safe; consumers are idempotent under duplicate delivery.
4. **Integration:** add coverage for persistence, optimistic concurrency, event publication, authentication/authorization boundaries, and externally observable behavior when changed.

Also run the repository formatter, lint/type checks, and targeted tests. Do not make checks pass by weakening lint rules, removing assertions, skipping tests, adding broad suppressions, or lowering quality thresholds.

## Review checklist

Do not call the work complete until all answers are yes:

- Does a reviewed domain model/document explain the aggregate, commands, events, invariants, projections, and effects?
- Is the event stream still the sole source of truth for business state?
- Are immediate invariants contained in one optimistic-concurrency aggregate boundary?
- Are event meanings immutable, versioned, and compatible with historical replay?
- Is sensitive data absent from events and logs?
- Can every changed projection be rebuilt from the full stream?
- Are consumers and external effects safe under duplicate delivery and retry?
- Are cross-aggregate workflows event-driven rather than distributed transactions?
- Are every relevant producer, consumer, client, and persisted/public contract accounted for?
- Do command-to-events, replay, and projection/idempotency tests pass along with repository quality checks?
