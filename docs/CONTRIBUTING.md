# Contribution Guide

## Who can contribute?

Anyone may propose a focused contribution through a Pull Request. You do not need to be a project member first.

## Good first contributions

- fix a bug;
- improve documentation;
- add a test;
- implement one roadmap task;
- improve UI feedback;
- build one map area;
- add one NPC;
- improve performance;
- propose a balance change with evidence.

## Before you start

Read:

1. `AGENTS.md`
2. `docs/PROJECT_CHARTER.md`
3. `docs/ROADMAP.md`
4. the relevant technical/design document.

Then choose one issue/task or create a focused issue describing the work.

## Pull Request process

1. Fork the repository.
2. Create a branch from `main`.
3. Keep the PR focused on one logical change.
4. Follow the PR template.
5. Test the change.
6. Submit the PR.
7. Maintainers review whether the change fits the project direction and works correctly.

## Joining the project

If you want to participate regularly, submit a PR with the title:

`[JOIN] Your GitHub username`

Use the PR template and select the contributor-request section. You may also combine a join request with a small first contribution.

A join PR is a **request to participate**, not automatic write access. Maintainers decide permissions after reviewing the request and contribution history.

## Design proposals

If you have a new feature idea, do not immediately implement a large PR. Open a proposal issue first unless the change is tiny and clearly within the roadmap.

A proposal should explain:

- player problem/opportunity;
- gameplay impact;
- why it fits the core loop;
- expected complexity;
- possible abuse/balance risks;
- how success would be tested.

## PR quality bar

A PR may be rejected or asked to change when it:

- conflicts with the Project Charter;
- expands scope without justification;
- trusts the client with authoritative state;
- hard-codes balance values unnecessarily;
- duplicates an existing service;
- bundles unrelated changes;
- cannot explain how it was tested.

## Roblox Studio files

If binary Studio assets or `.rbxl/.rbxlx` files are introduced, keep the repository documentation synchronized so another contributor can understand where the asset belongs and how it is used. Do not commit secrets, private keys, tokens, or credentials.
