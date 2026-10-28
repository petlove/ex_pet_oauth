# ExPetOauth

Hex library that adds Google OAuth 2.0 login (restricted to Petlove email domains) to
Phoenix apps, via Ueberauth. Consumed from Hex by apps such as stargazer.

## Layout

- `lib/`: the library. Only `lib/`, `mix.exs`, `README.md`, `LICENSE` and
  `.formatter.exs` are shipped to Hex (`package/0` in `mix.exs`).
- `test/support/ex_pet_oauth_dummy/`: a Phoenix dummy app used only by the tests. Its
  dependencies are `only: :test`.

## Tests

`mix test` creates and migrates the dummy app's database first, so it needs a local
Postgres (`postgres@localhost`, see `test/support/ex_pet_oauth_dummy/config/test.exs`).
Minimum Elixir is 1.15 (`mix.exs`).

## Commits, PRs and releases

- Commit subjects and PR titles use Conventional Commits. PRs are squash-merged, so the
  PR title is what lands on `main`.
- Breaking changes for apps using the library (Elixir/OTP or dependency floor raised,
  public function or config key removed/renamed) need `!`: `fix!:`, `feat!:`. Recheck the
  PR title whenever a breaking commit is added to an open PR.
- Nephila releases from tags (`vX.Y.Z`) with git-cliff. Never hard-code a version in
  `mix.exs` or add a version file, and never pick a version number: `mix.exs` reads it
  from `EX_PET_OAUTH_VERSION`, else the tag, else Hex's `hex_metadata.config` (see
  "Where the version comes from" in [RELEASING.md](RELEASING.md)).
- `mix.lock` is not shipped to Hex: bumping a vulnerable dependency there only fixes this
  repo's builds. To force a patched version on consuming apps, raise the floor in `mix.exs`.
