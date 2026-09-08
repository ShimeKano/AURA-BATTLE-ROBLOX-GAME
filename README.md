# AURA BATTLE

Roblox real-time PvE/PvP progression game.

> **Farm Aura → become stronger → enter PvP → defeat players → steal part of their Aura → become a bigger target.**

## Project rules

The repository is governed by:

1. `Master Spec` — the current game design and technical specification.
2. `docs/PROJECT_CHARTER.md` — non-negotiable product direction.
3. `docs/ARCHITECTURE.md` — technical boundaries and service responsibilities.
4. `docs/GAMEPLAY_RULES.md` — authoritative gameplay rules.
5. `docs/ROADMAP.md` — what should be built now, later, or never unless approved.
6. `AGENTS.md` — instructions for humans and AI contributors.

If a proposed change conflicts with these documents, **do not silently implement it**. Open a discussion/issue or explain the conflict in the PR.

## Current status

**Phase:** pre-production / foundation.

The repository intentionally contains design and governance documents before the Roblox implementation. The first implementation milestone is the v0.1 vertical slice described in `docs/ROADMAP.md`.

## Contributing

Small contributions are welcome. You do not need to be a core team member to propose a change.

Simple flow:

1. Fork the repository.
2. Create a focused branch.
3. Make one understandable change.
4. Run the relevant tests/checks.
5. Open a Pull Request using `.github/pull_request_template.md`.

A contributor may submit documentation, balancing suggestions, Roblox/Luau code, UI, map work, VFX/SFX, tests, tooling, or bug fixes.

**Do not build a large feature without first checking the project direction.**

## For AI contributors

Read `AGENTS.md` first, then read only the relevant sections of the Master Spec and architecture documents. State which task you are implementing and what is explicitly out of scope. Never invent a new game direction merely to make a task larger.

## Core principle

The project is successful only if the core loop is fun and players return. More systems, assets, or monetization do not automatically mean progress.
