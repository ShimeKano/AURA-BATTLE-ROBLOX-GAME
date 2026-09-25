# AURA BATTLE — Development Rules

## 1. V1 Scope Comes First

**Do not expand the project just because an idea is cool.**

Until V1 has been tested by real players and the core gameplay loop has been validated, prioritize:

- Core combat
- Aura progression
- Skills
- NPC farming
- PvP
- Death / risk / rewards
- Essential UI
- Basic map and onboarding
- Performance and bug fixing

Large future systems should normally go into the backlog instead of being implemented immediately.

## 2. Ideas Are Not Rejected — They Are Scheduled

A large idea can be kept even when it is not appropriate for V1.

Examples:

- Boss Events
- Large numbers of skills
- Guilds
- Trading
- Raids / dungeons
- Large world expansions
- Complex progression systems
- Expensive custom 3D assets

**Keep the vision. Delay the implementation.**

## 3. AI Must Challenge Scope Creep

When a new request would significantly increase V1 scope, the AI/developer should stop and ask:

1. Does this directly help validate the V1 core gameplay loop?
2. Is the current version already tested by real players?
3. What problem does this feature solve?
4. What is the implementation and maintenance cost?
5. Can a smaller prototype answer the same question?

If the feature does not justify its cost at the current stage, recommend postponing it.

## 4. Do Not Optimize for Feature Count

More systems do not automatically make the game more fun.

Every V1 feature should have a clear purpose in the player experience:

> Goal → Action → Reward → New Goal

The project should prioritize whether players voluntarily continue playing over how many systems have been implemented.

## 5. Prototype Before Production

For expensive or complex ideas:

**Prototype → Test → Learn → Improve → Production**

Do not build the full version of a large feature before there is evidence that the underlying gameplay is worth expanding.

## 6. Performance Is a Requirement

"Possible" does not automatically mean "practical."

Visual effects, NPC counts, networking, animations, models, and systems must consider target-device performance.

Do not promise "no lag." Define reasonable performance constraints instead.

## 7. Player Testing Is the Reality Check

Internal testing by the developer is not enough.

Before major V1 expansion, test with real players and observe:

- Do new players understand what to do?
- Do they enjoy the core combat?
- Do they voluntarily continue playing?
- What makes them leave?
- What do they ask for without being prompted?

Player behavior and feedback should guide expansion.

## 8. Separate Vision From Implementation

The creator owns the game vision and design decisions.

AI/developers are responsible for:

- Breaking ideas into implementable systems
- Identifying technical constraints
- Suggesting simpler prototypes
- Explaining risks and trade-offs
- Implementing approved requirements
- Testing and fixing problems

AI must not silently remove or change important design goals just because they are difficult.

## 9. Scope Levels

Use these labels when planning work:

- **P0 — V1 Critical:** required to validate the core game.
- **P1 — V1 Support:** useful for making the V1 experience complete.
- **P2 — Future:** valuable, but should wait for player validation.
- **P3 — Dream/Experimental:** ambitious ideas to revisit later.

## 10. The Golden Rule

> **Build the smallest version that can prove people want to play AURA BATTLE.**

Do not confuse:

- "We can build it."
- "We should build it now."
- "Players will care about it."

These are three different questions.

---

## Current V1 Principle

AURA BATTLE should first prove that this loop is enjoyable:

**Combat → Aura → Skills / Build → PvP → Risk / Reward → More Combat**

Only after this loop shows real player interest should major content expansion become a priority.
