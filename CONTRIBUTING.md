# 🤝 Contributing to LifeHub

Welcome, and thank you for considering contributing to **LifeHub**!

This project is a personal learning journey and a full-stack showcase, built
with an Nx monorepo to combine **backend, frontend, AI/ML, cloud, IAC, mobile,
and desktop**. Contributions are open once the MVP is stable, but documentation
and internal discipline apply from day one.

---

## 📦 Monorepo Structure

This project uses Nx for modular monorepo management. The layout looks like:

```
lifehub/
├── apps/                        # Application entry points
│   ├── api/                     # Express backend (REST API)
│   ├── web/                     # React frontend (user dashboard)
│   ├── desktop/                 # Electron app (wrapper for web, optional)
│   └── mobile/                  # Flutter or React Native app (planned)
│
├── libs/                        # Shared and reusable libraries
│   ├── auth/                    # Authentication logic and guards
│   ├── ai/                      # AI/ML modules (e.g. RAG pipeline, summarization)
│   ├── journal/                 # Journal and mood tracking logic
│   ├── task/                    # Task, habit, and productivity logic
│   └── types/                   # Shared TypeScript interfaces and DTOs
│
├── apps/docs/                   # Docusaurus-powered documentation site
├── tools/                       # Custom CLI tools or dev scripts (optional)
├── nx.json                      # Nx configuration
├── tsconfig.json                # Root TypeScript config
├── package.json                 # Project dependencies and scripts
└── ...
```

## 🧑‍💻 Development Setup

Clone and install:

```bash
git clone https://github.com/prabal01pathak/lifehub.git
cd lifehub
pnpm install     # or npm install
```

To serve apps locally:

```bash
npx nx serve api     # Backend
npx nx serve web     # Frontend
```

To run lint, format, test:

```bash
npx nx format:write
npx nx lint api
npx nx test web
```

---

## 🔍 Affected Commands (Nx Feature)

For performance and CI/CD, you can scope commands only to changed apps/libs:

```bash
npx nx affected:apps
npx nx affected:lint
npx nx affected:test
npx nx affected:build
```

---

## ✅ Commit Message Convention

We follow the **Conventional Commits** format + scoped naming:

```
<type>(<scope>): <message>
```

### 🔖 Types

- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation only
- `style`: Code formatting (whitespace, prettier, etc.)
- `refactor`: Code change that neither fixes a bug nor adds a feature
- `test`: Adding or updating tests
- `chore`: CI, tooling, or non-app logic

### 🧩 Scopes (use folders)

- `api`, `web`, `mobile`, `desktop`
- `auth`, `task`, `journal`, `ai`, `types`
- `infra`, `docs`, `root`

### ✅ Examples

```bash
feat(api): add /tasks POST route
fix(web): fix broken dark mode toggle
refactor(auth): move token decoding to shared lib
docs(journal): add usage guide to README
```

---

## 🧪 Testing & Code Quality

Please run the following before committing:

```bash
npx nx format:check
npx nx lint affected
npx nx test affected
```

You can use the shortcut:

```bash
pnpm check     # If defined in package.json scripts
```

---

## 🚀 Pull Request Guidelines

- Keep PRs focused (one feature/fix per PR)
- Use clear PR titles, mirroring the commit style
- Add screenshots or demo videos for UI changes (if applicable)
- Reference issues or wiki pages if relevant
- Avoid committing `.env` or secrets — always use `.env.example`

---

## 🛡️ Project Values

This project is about:

- **Modularity**
- **Documentation**
- **Reusability**
- **AI-assisted productivity**
- **Developer learning**

Please respect these in your contributions.

---

## 🧠 Final Note

> _“Document everything as you go. The journey is as valuable as the
> destination.”_

This project is also a portfolio of growth and architecture. Keep your commits
clean, your logic reusable, and your contributions valuable.

---

Thanks for being a part of LifeHub! 🚀

```

```
