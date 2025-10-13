# Repository Guidelines

## Project Structure & Module Organization
- Keep the repository root lightweight: `package.json` and `package-lock.json` define dependencies, while `node_modules/` remains disposable.
- Place agent entry points and orchestration logic under `src/`; group reusable helpers in `src/lib/`, configuration constants in `src/config/`, and longer prompt templates in `assets/`.
- Mirror this layout for tests under `tests/` (for example, `tests/src/lib/runAgent.test.js` exercises `src/lib/runAgent.js`) to keep navigation and coverage straightforward.

## Build, Test, and Development Commands
- `npm install` — sync local dependencies with the manifest.
- `node src/index.js` — execute the primary agent locally; adjust the path if the entry script moves.
- `node --test tests` — run the full test suite; narrow scope with `node --test tests/src/lib/foo.test.js` when iterating.
- `npx prettier --check "src/**/*.js"` — verify formatting, adding `--write` before committing fixes.

## Coding Style & Naming Conventions
- Write modern ES2022 JavaScript using 2-space indentation, semicolons, and single quotes unless template literals add clarity.
- Name reusable modules with camelCase filenames (`src/lib/dispatchTools.js`); reserve PascalCase for classes and constructors.
- Centralize environment variable reads in `src/config/env.js` and reference them via `process.env.KEY` throughout the codebase.
- Run Prettier prior to opening a pull request to ensure consistent spacing, quotes, and trailing commas.

## Testing Guidelines
- Use Node’s built-in test runner and add at least one positive and one negative case when introducing a feature or regression fix.
- Name suites `*.test.js` and place them under mirrored `tests/` paths for the code they exercise.
- Mock external services and tool executions so tests remain deterministic and offline-friendly.

## Commit & Pull Request Guidelines
- Write concise, imperative commit messages such as `Add agent dispatcher for tool routing`, keeping each commit focused on a single logical change.
- In pull requests, summarize the behavior change, link related issues, and paste relevant test output (for example, `node --test tests`).
- Include screenshots or transcripts whenever conversational flows or agent behavior shifts.

## Security & Configuration Tips
- Never commit API keys or secrets; rely on `.env` files kept out of version control.
- Document required environment variables in the PR body and update `README.md` when configuration expectations change.
