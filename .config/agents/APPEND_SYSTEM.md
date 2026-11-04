# Event-Sourced DDD Engineering

Use Domain-Driven Design (DDD), CQRS, and event sourcing for durable business behavior.

## Default architecture

- Prefer Rust for new backend/domain services when appropriate. For Rust event-sourced systems, use [`cqrs-es`](https://docs.rs/cqrs-es/latest/cqrs_es/) unless the user approves and documents an exception.
- In TypeScript and other ecosystems, keep the same domain, event-sourcing, compatibility, and replay principles with an appropriate framework.
- Treat immutable domain events as the source of truth for business-owned state. Tables, caches, indexes, and API read models are rebuildable projections, not authorities.
- Do not introduce CRUD persistence as a bypass around the event stream.

## Model before coding

Before implementing or materially changing business behavior:

1. Find existing domain documentation and terminology.
2. If it is absent or inadequate, create or update a lightweight DDD design artifact for review: bounded context, ubiquitous language, aggregate/stream boundary, commands, events, invariants, projections, consumers, and external effects.
3. Implement from the domain model—not from database tables, HTTP routes, UI state, or ORM models.

Creating this artifact alongside the first thin implementation slice is acceptable, but it must be reviewed before work is complete. Load the `event-sourced-ddd` skill before designing or changing aggregates, commands, events, projections, event-store persistence, migrations, or consumers.

## Non-negotiable event rules

- Commands ask one aggregate/stream to decide whether a fact may occur; use optimistic concurrency.
- Enforce invariants in command handling. State changes happen only by applying emitted events.
- Keep cross-aggregate consistency asynchronous and event-driven; do not simulate distributed transactions.
- Events are immutable, past-tense facts. Version their schemas and never change an existing event's meaning.
- Preserve replayability using explicit upcasters, migration adapters, or compatibility decoding. Test historical payloads.
- Prefer CloudEvents v1.0-compatible envelopes where practical. Retain event ID, stream ID/type/version, event type/schema version, time, correlation ID, and causation ID where safe and available.
- Never place secrets, credentials, tokens, private keys, or directly identifying sensitive data in event payloads or logs.
- Projections and snapshots are disposable and rebuildable from the complete event stream. Consumers and external effects must tolerate at-least-once delivery and be durably idempotent.

## Compatibility and verification

- Identify all producers and consumers before changing persisted or public contracts: events, streams, projections, APIs, configuration, serialized payloads, identity claims, and clients.
- Do not rename, remove, reinterpret, or make required a persisted/public field without a reviewed compatibility plan, migration path, and tests. Prefer additive changes and safe defaults.
- For each business behavior change, require command-to-events tests, aggregate replay tests, and projection/consumer idempotency tests. Add integration coverage when persistence, concurrency, publication, or external behavior changes.
- Run formatting, linting/type checks, and relevant tests. Do not weaken checks, remove tests/assertions, or add broad suppressions merely to pass.
- Keep changes small and independently verifiable. Explain any exception, migration, or compatibility risk before making it.
