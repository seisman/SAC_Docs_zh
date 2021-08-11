---
name: SAC_Docs_zh release checklist
about: Checklist for a new SAC_Docs_zh release
title: 'Release SAC_Docs_zh vX.Y'
labels: ''
assignees: ''

---

**Release**: [vX.Y](https://github.com/seisman/SAC_Docs_zh/milestones/?)
**Scheduled Date**: YYYY/MM/DD
**Pull request due date**: YYYY/MM/DD

**Priority PRs/issues to complete prior to release**
- [ ] X ()
- [ ] Y ()

**Before release**:
- [ ] Document all the important changes in `appendix/changelog.rst`
- [ ] Set the release version and date in `appendix/changelog.rst`
- [ ] Set the release version `SACDOCVERSION` in `source/SAC_style.sty`
- [ ] Set the release version in `source/conf.py`
- [ ] Add the release information to `source/version.rst`

**Release**:
- [ ] Set the tag version to vX.Y
- [ ] Manually upload the PDF to the release

**After release**:
- [ ] Bump the version number to "X.Y-dev" in `source/conf.py` and `source/SAC_style.sty`
- [ ] Bump the SAC version number in `source/SAC_style.sty` if necessary
---

- [ ] Party :tada: (don't tick before all other checkboxes are ticked!)
