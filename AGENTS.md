# AURA BATTLE — Contributor & AI Instructions

## 1. Read this before changing the project

This project is a Roblox game. The intended experience is a real-time PvE/PvP progression game centered on **Aura**.

The primary loop is:

`Farm NPC → gain Aura → unlock power → enter PvP → defeat players → steal part of their Aura → become a bigger target → repeat.`

The project is deliberately scope-controlled. A contributor's job is not to redesign the game unless the task explicitly asks for design work.

## 2. Source of truth

Use these documents in this order:

1. `docs/PROJECT_CHARTER.md` — product direction and non-negotiable principles.
2. `Master Spec` — detailed design.
3. `docs/GAMEPLAY_RULES.md` — exact gameplay rules.
4. `docs/ARCHITECTURE.md` — implementation boundaries.
5. `docs/ROADMAP.md` — current priority and scope.
6. `docs/DECISIONS.md` — recorded decisions and rationale.

If documents disagree, stop and report the conflict. Do not guess silently.

## 3. Rules for every implementation

- Server authoritative for Aura, damage, deaths, rewards, purchases, permissions, and progression.
- Never trust client-provided currency, damage, purchase state, target validity, or teleport state.
- Aura changes must go through `AuraService` once implementation exists.
- Balance numbers belong in configuration, not scattered through gameplay scripts.
- Keep services small and single-purpose.
- Do not make unrelated refactors in a focused PR.
- Do not add a dependency without explaining why.
- Do not add a feature solely because it is technically interesting.
- Prefer the simplest implementation that proves the intended gameplay.
- Preserve compatibility with future expansion where practical, but do not build speculative systems.

## 4. AI-specific workflow

Before coding:

1. Read this file.
2. Read the relevant Master Spec sections.
3. Read the relevant architecture section.
4. Identify the exact task and Definition of Done.
5. List assumptions if anything is ambiguous.

While coding:

- Implement only the requested scope.
- Reuse existing services/configuration.
- Keep public APIs explicit.
- Add comments for non-obvious game rules, not for every line.

After coding:

- Check the acceptance criteria.
- Check server/client trust boundaries.
- Check that balance values are configurable.
- Report changed files and tests performed.
- Mention any known limitations.

## 5. What counts as going off-target

The following require explicit approval before implementation:

- changing the core Aura loop;
- replacing real-time combat with turn-based combat;
- removing the PvP risk/reward system;
- making Aura only cosmetic;
- making AFK progression stronger than active progression by default;
- introducing a new primary currency;
- adding a completely new genre/system unrelated to progression/PvP;
- redesigning monetization into a different business model;
- adding large content packages before the v0.1 loop is validated.

## 6. PR discipline

A good PR should answer:

- What problem does this solve?
- Which project requirement does it satisfy?
- What changed?
- How was it tested?
- What is intentionally not included?

Small PRs are preferred. A contributor does not need permission to submit a small bug fix, documentation improvement, test, or focused implementation PR.
