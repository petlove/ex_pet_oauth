# Releasing

Versions, tags and `CHANGELOG.md` are produced by
[release-please](https://github.com/googleapis/release-please). Nobody picks version
numbers by hand: the next version is computed from the
[Conventional Commit](https://www.conventionalcommits.org/) titles merged into `main`.

## Commit and PR titles

PRs are squash-merged, so **the PR title becomes the commit** release-please reads.

| Title | Bump |
|---|---|
| `fix: ...`, `perf: ...` | patch |
| `feat: ...` | minor |
| `fix!: ...` / `feat!: ...` (or a `BREAKING CHANGE:` footer) | major |
| `chore:`, `docs:`, `build:`, `test:`, `ci:` | none (not in the changelog) |

Anything that can break apps using the library — raising the Elixir/OTP floor, removing or
renaming a public function, changing config keys, raising a dependency floor — needs `!`.
If a PR gains a breaking commit, update its title before merging.

## Release flow

release-please runs locally through its CLI (there is no CI in this repo). You need a
`gh` login with write access to `petlove/ex_pet_oauth`.

1. **Open or refresh the release PR.** It bumps `VERSION` (read by `mix.exs`) and updates
   `CHANGELOG.md` and `.release-please-manifest.json`:
   ```sh
   npx -y release-please@17.11.2 release-pr \
     --token="$(gh auth token)" --repo-url=petlove/ex_pet_oauth
   ```
   If a breaking change was merged without `!`, force the version with
   `--release-as=X.Y.Z` and add a "BREAKING CHANGES" note to `CHANGELOG.md` in the release PR.
2. **Review and merge the release PR** (squash).
3. **Tag `vX.Y.Z` and create the GitHub Release.** Run this right after the merge;
   release-please won't open the next release PR until the previous one is released:
   ```sh
   npx -y release-please@17.11.2 github-release \
     --token="$(gh auth token)" --repo-url=petlove/ex_pet_oauth
   ```
4. **Publish to Hex** (Hex package owners only):
   ```sh
   git switch main && git pull && mix hex.publish
   ```

## First release (3.0.0) — one-off

- Run step 1 with `--release-as=3.0.0`: PR #3 raised the minimum Elixir to 1.15 but was
  merged as `fix:`, so release-please alone would propose 2.1.1. Add the breaking note
  ("requires Elixir ~> 1.15") to the changelog in the release PR.
- 2.1.0 was tagged but never published to Hex, so 3.0.0 is the first Hex release with the
  `outsourcing.petlove.com.br` login; the generated changelog lists it on purpose.
- Hex publishing waits until the package ownership transfer is done.
