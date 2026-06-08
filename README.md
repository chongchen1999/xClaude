# xClaude

我的个人 [Claude Code](https://docs.claude.com/en/docs/claude-code) 配置仓库（dotfiles）。把这一份配置 clone 下来、跑一下 `install.sh`，就能在任意机器上拉起一致的 Claude Code 工作环境：行为准则、权限策略、自定义命令、主题。

## 内容

| 文件 / 目录 | 作用 | 安装目标 |
|---|---|---|
| `CLAUDE.md` | 全局行为准则（Think Before Coding / Simplicity First / Surgical Changes / Goal-Driven），降低 LLM 常见编码错误 | `~/.claude/CLAUDE.md` |
| `settings.json` | Claude Code 主设置：模型、权限 allow/deny/ask、env、插件、主题、effort level | `~/.claude/settings.json` |
| `commands/` | 自定义 slash 命令（`/report`、`/review`） | `~/.claude/commands/` |
| `themes/` | 自定义配色主题（neon / gruvbox-material / tokyo-night） | `~/.claude/themes/` |
| `install.sh` | 把以上文件**软链**进 `~/.claude/` 并装好插件 | — |

## 安装

```bash
git clone git@github.com:chongchen1999/xClaude.git
cd xClaude
./install.sh
```

`install.sh` 会：
1. 把 `settings.json`、`CLAUDE.md`、`commands/`、`themes/` **软链**进 `~/.claude/`（`ln -sfn`，幂等）
2. 安装 `pyright-lsp` 插件

软链意味着**在本仓库里改动即时生效**，无需重新安装；`git pull` 拉到的更新同样自动生效。

> ⚠️ 安装会**替换** `~/.claude/` 下的同名文件/目录。已有自定义配置请先备份。

## 配置要点

### CLAUDE.md — 行为准则
四条核心准则，偏向「谨慎优先于速度」：先想清楚再写、最小实现、外科手术式改动、目标驱动并验证。

### settings.json — 权限策略
- **allow**：只读 git、搜索、各语言 test 命令免确认
- **ask**：`git push`、包发布、装包、`WebFetch` 需确认
- **deny**：`rm -rf`、`sudo`、force push、`reset --hard`，以及 `.env` / 私钥 / 凭据文件的读取
- 模型 `claude-opus-4-8[1m]`，`effortLevel: high`，主题 `custom:neon`

### commands/ — 自定义命令
- `/report <good|bad|other> <remark>` — 调 `klaude-report` 生成 issue 报告
- `/review` — 用 code-review-skill 审当前 diff（安全 / 性能 / 可维护性）

### themes/ — 主题
neon、gruvbox-material、tokyo-night 三套配色，当前默认 neon。
