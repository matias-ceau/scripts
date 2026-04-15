# CLAUDE.md — Scripts repo

## Structure
- `bin/` — scripts exécutables principaux (~107 fichiers), tous symlinqués dans `~/.local/bin`
- `lib/` — bibliothèques partagées (`env.sh` : loader d'environnement modulaire)
- `meta/` — scripts de maintenance (symlinks, doc, métadonnées) — aussi symlinqués
- `src/` — sources compilées (C avec Makefile)
- `docs/` — documentation auto-générée par `meta/llm-script-describer.py`
- `dev/` — expérimental/WIP, `archived/` — déprécié

## Conventions des scripts

### Entête obligatoire
Chaque script doit avoir une ligne `#INFO:` pour être indexé :
```
#INFO:#@CATEGORY@=YYYY-MM= "description courte"
```

### Shell
- Shebang : `#!/usr/bin/bash` (bash) ou `#!/bin/sh` (POSIX)
- Ajouter `set -euo pipefail` dans les scripts bash non-interactifs
- Pas de `eval` sur des variables externes ; utiliser `bash -c` pour les chaînes internes

### Python
- Shebang uv inline script :
  ```python
  #!/usr/bin/env -S uv run --script --quiet
  # /// script
  # requires-python = ">=3.14"
  # dependencies = [...]
  # ///
  ```
- Préférer stdlib (`urllib.request`, `http.client`) sur `requests`
- Type hints sur toutes les signatures publiques

## Workflow symlinks
`meta/utils_update_symlinks.sh` scanne tout `$SCRIPTS` (pas seulement `bin/`) pour les fichiers exécutables et les symlinke dans `~/.local/bin`. Le CSV `symlink_data.csv` est reconstruit à chaque run.

## Variables d'environnement clés
- `$SCRIPTS` — racine du repo
- `$GIT_REPOS` — répertoire parent des dépôts git
- `$LOCALDATA` — données locales (wallpapers, etc.)
- `$PASSWORD_STORE_DIR` — store pass

## Doc generation
`meta/llm-script-describer.py` génère `docs/scripts/<nom>.md` via OpenAI. Le cache est dans `script_info.json`. Ne pas modifier les docs manuellement — elles sont regénérées automatiquement.
