#!/usr/bin/env bash
set -euo pipefail

# Clean
rm -rf build
rm -rf docs/en/_build docs/en/locale
rm -rf docs/it/_build docs/it/locale

# POT from EN and IT
python -m sphinx -b gettext docs/en docs/en/_build/gettext
python -m sphinx -b gettext docs/it docs/it/_build/gettext

# PO: EN→IT
(cd docs/en && sphinx-intl update -p _build/gettext -l it -d locale)

# PO: IT→EN
(cd docs/it && sphinx-intl update -p _build/gettext -l en -d locale)

# (optional) build .mo
(cd docs/en && sphinx-intl build -d locale)
(cd docs/it && sphinx-intl build -d locale)

# (optional) build HTML
python -m sphinx -b html -D language=en docs/en build/html/en
python -m sphinx -b html -D language=it docs/it build/html/it

echo "Done. POT/PO rigenerati. HTML in build/html/{en,it}"