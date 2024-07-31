# Citeboard (citeboard.sh)

---

A script to copy citations or open papers from a bibliography.

---

### Table of contents

- [Dependencies](#dependencies)
- [Description](#description)
    - [Overview](#overview)
    - [Usage](#usage)
    - [Examples](#examples)
- [Notes](#notes)

---

<a name="dependencies" />

### Dependencies

- `findutils`
- `xsel`
- `dmenu`

<a name="description" />

### Description

<a name="overview" />

#### Overview

Citeboard is a shell script designed to facilitate the management of academic references. It searches a specified directory for BibTeX files, prompting the user to select a citation. After selection, it provides an option to either copy the citation to the clipboard or open the associated paper directly using `evince`, a PDF viewer.

The script operates by utilizing a combination of Unix utilities:
- **grep**: To search for specific patterns in the BibTeX files.
- **sed**: To format and clean the output.
- **dmenu**: To create a user-friendly selection interface.
- **xargs**: To execute commands with the reference file paths.

The script internally relies on the path `data/bib/` for BibTeX files and `data/zotero/storage` to find the associated papers.

---

<a name="usage" />

#### Usage

To execute the script, run it directly from the terminal:

```bash
sh /home/matias/.scripts/citeboard.sh
```

Upon execution, the script will present a list of available citations (extracted from the BibTeX files) using `dmenu`. After selecting a citation, another prompt allows you to choose between copying the citation to the clipboard or opening the corresponding paper.

The user should ensure that the paths to the bibliography and storage directories are correctly set in the script according to their local configuration.

<a name="examples" />

#### Examples

1. **Run the script**: 
   ```bash
   sh /home/matias/.scripts/citeboard.sh
   ```

2. **Select a citation** from the dmenu list that appears.

3. **Choose your action**:
   - Select "clipboard" to copy the citation.
   - Select "open" to view the paper in Evince.

---

<a name="notes" />

### Notes

Ensure that the directories for the BibTeX files (`data/bib/`) and the Zotero storage files (`data/zotero/storage`) are correctly set up. The script currently utilizes hardcoded paths; these should be adjusted according to your file organization.

> **Critique**: 
> The script has a clean approach but could benefit from additional error handling. For example, if no paper is found for a selected citation, the user should receive a notification. Also, depending on the user's preference, it might be useful to allow configuration of directories through command-line arguments or a configuration file instead of hardcoded values. Adding comments or more verbose prompts in `dmenu` could also enhance usability.