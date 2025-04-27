# PR-Review-Comments-Export

## Introduction
`PR-Review-Comments-Export` is a simple script tool designed to export comments made by a specific code reviewer in a GitHub repository's Pull Requests. This tool helps you quickly generate a CSV file containing all relevant comment details. By analyzing these comments, teams can better understand the review standards and design focus of key stakeholders, even before formal documentation is updated.

## How to Use

### 1. Clone the Repository
First, clone this project to your local machine:
```bash
git clone <repository-url>
cd PR-Review-Comments-Export
```

### 2. Make the Script Executable
Before running the script, make sure to make `export.sh` executable:
```bash
chmod +x export.sh
```

### 3. Authenticate with GitHub CLI
Ensure you are logged in to GitHub CLI to access the repository:
```bash
gh auth login
```
Follow the prompts to authenticate with your GitHub account.

### 4. Run the Script
When running the script, you need to provide two arguments:
- **Repository Name**: Format as `owner/repo`, e.g., `microsoft/vscode`.
- **Reviewer Username**: GitHub username, e.g., `john_doe`.

Example:
```bash
./export.sh microsoft/vscode john_doe
```

### 5. Output File
The script will generate a CSV file named `<username>_comments.csv`, e.g., `john_doe_comments.csv`. The file will include:
- PR Number
- Comment Body
- Comment URL
- Code Diff Hunk

### 6. Requirements
- **GitHub CLI (gh)**: Ensure GitHub CLI is installed and configured.
  - Installation Guide: [GitHub CLI Official Documentation](https://cli.github.com/)
- **jq**: Used for parsing JSON data.
  - Installation:
    ```bash
    brew install jq
    ```

## Notes
- For private repositories, ensure you are logged in via `gh auth login` and have the necessary access permissions.
- If you encounter a "permission denied" error when running the script, check the file permissions and ensure it is executable.

## Example
Suppose you want to export all comments made by `john_doe` in the `microsoft/vscode` repository. Run the following command:
```bash
./export.sh microsoft/vscode john_doe
```
The generated file `john_doe_comments.csv` will contain all relevant comment details.

---

# PR-Review-Comments-Export

## 简介
`PR-Review-Comments-Export` 是一个简单的脚本工具，用于导出指定代码审查者 (Code Reviewer) 在某个 GitHub 仓库中的 Pull Request 评论。通过此工具，您可以快速生成一个 CSV 文件，包含所有相关评论的详细信息。通过分析这些评论，团队可以更好地理解关键利益相关者的审查标准和设计关注点，即使在正式文档更新之前。

## 使用方法

### 1. 克隆仓库
首先，克隆此项目到本地：
```bash
git clone <repository-url>
cd PR-Review-Comments-Export
```

### 2. 修改脚本为可执行
在运行脚本之前，需要将 `export.sh` 修改为可执行文件：
```bash
chmod +x export.sh
```

### 3. 使用 GitHub CLI 登录
确保您已通过 GitHub CLI 登录以访问仓库：
```bash
gh auth login
```
按照提示完成 GitHub 账户的身份验证。

### 4. 运行脚本
运行脚本时需要提供两个参数：
- **仓库名称**：格式为 `owner/repo`，例如 `microsoft/vscode`。
- **审查者用户名**：GitHub 用户名，例如 `john_doe`。

运行示例：
```bash
./export.sh microsoft/vscode john_doe
```

### 5. 输出文件
脚本会生成一个 CSV 文件，文件名格式为：`<username>_comments.csv`，例如 `john_doe_comments.csv`。文件内容包括：
- PR 编号
- 评论内容
- 评论链接
- 代码差异片段

### 6. 环境要求
- **GitHub CLI (gh)**：确保已安装并配置好 GitHub CLI 工具。
  - 安装方法：[GitHub CLI 官方文档](https://cli.github.com/)
- **jq**：用于解析 JSON 数据。
  - 安装方法：
    ```bash
    brew install jq
    ```

## 注意事项
- 如果仓库是私有的，请确保您已通过 `gh auth login` 登录并具有访问权限。
- 如果脚本运行时提示权限不足，请检查文件权限并确保已正确设置可执行权限。

## 示例
假设您想导出 `microsoft/vscode` 仓库中用户 `john_doe` 的所有评论，运行以下命令：
```bash
./export.sh microsoft/vscode john_doe
```
生成的文件 `john_doe_comments.csv` 将包含所有相关评论的详细信息。


