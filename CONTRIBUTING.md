# Contributing to File Copier

Thanks for considering contributing to File Copier! This guide will help you get started.

## Quick Start for Contributors

1. **Fork the repository** on GitHub
2. **Clone your fork**:
   ```bash
   git clone https://github.com/YOUR-USERNAME/file-copier.git
   cd file-copier
   ```
3. **Create a branch** for your feature:
   ```bash
   git checkout -b feature/my-awesome-feature
   ```
4. **Make your changes** to `FileCopier.ps1`
5. **Test your changes** by running the script:
   ```powershell
   .\FileCopier.ps1
   ```
6. **Commit and push**:
   ```bash
   git add .
   git commit -m "Add my awesome feature"
   git push origin feature/my-awesome-feature
   ```
7. **Open a Pull Request** on GitHub

## Development Guidelines

### Code Style

- Use clear, descriptive variable names
- Add comments for complex logic
- Follow existing PowerShell formatting conventions
- Keep the GUI layout organized by section

### Testing Your Changes

Before submitting a PR, please test:

1. **Basic functionality** - Does the core copying work?
2. **All input combinations** - Test with/without optional fields
3. **Error handling** - Try invalid paths, missing fields, etc.
4. **Edge cases** - Empty folders, no matching files, etc.

### What Makes a Good Contribution

We're looking for contributions that:

- Fix bugs or add useful features
- Improve performance or code quality
- Enhance user experience
- Add helpful documentation
- Are well-tested

We're **not** looking for:

- Massive rewrites without discussion
- Changes that break existing functionality
- Unnecessary dependencies
- Features that complicate the simple use case

## Ideas for Contributions

Not sure what to work on? Here are some ideas:

### Features
- [ ] Add progress bar for large copy operations
- [ ] Save/load preset configurations
- [ ] Duplicate detection (skip files that already exist)
- [ ] Option to move files instead of copy
- [ ] File count preview before copying
- [ ] Drag-and-drop support for folders
- [ ] Recent folders dropdown
- [ ] Dark mode theme toggle
- [ ] Export log to text file

### Improvements
- [ ] Better error messages
- [ ] Optimize for large file sets (thousands of files)
- [ ] Add keyboard shortcuts
- [ ] Improve the GUI layout/spacing
- [ ] Add tooltips to help users
- [ ] Better handling of long file paths

### Documentation
- [ ] Add screenshots to README
- [ ] Create video tutorial
- [ ] Write blog post about use cases
- [ ] Translate README to other languages
- [ ] Add FAQ section

## Reporting Bugs

Found a bug? Please open an issue with:

1. **Clear title** - "Copy fails when..." not "Broken"
2. **Steps to reproduce** - Exact steps to recreate the bug
3. **Expected behavior** - What should happen
4. **Actual behavior** - What actually happens
5. **Environment** - Windows version, PowerShell version
6. **Screenshots** - If applicable

## Questions or Discussion

Have questions? Want to discuss a major change before implementing it?

- Open a GitHub Issue with the "question" label
- Tag it as "enhancement" if you're proposing a feature

## Code of Conduct

Be respectful, constructive, and collaborative. We're all here to make something useful.

- Be kind and patient with others
- Focus on what's best for the project
- Accept constructive criticism gracefully
- Help newcomers feel welcome

## Recognition

All contributors will be:
- Listed in the README
- Credited in release notes
- Appreciated for their time and effort!

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

**Ready to contribute?** Fork the repo and start coding! We can't wait to see what you build.
