#!/bin/sh

### Add ssh-keyscan to known_hosts
mkdir -p /home/vscode/.ssh
chmod 700 /home/vscode/.ssh
ssh-keyscan github.com >>/home/vscode/.ssh/known_hosts

### Ensure correct access rights
WORKSPACE="${WORKSPACE_FOLDER:-/workspaces}"
sudo chown -Rf vscode:vscode "$WORKSPACE"
sudo chmod -Rf 755 "$WORKSPACE"

#sudo chown -Rf vscode:vscode ${containerWorkspaceFolder:-.}/* ${containerWorkspaceFolder:-.}/.*
#sudo chmod -Rf 755 ${containerWorkspaceFolder:-.}/* ${containerWorkspaceFolder:-.}/.*

npm add -g npm@latest yarn@latest pnpm@latest
npm add -g opencode-ai & npm add -g @anthropic-ai/claude-code & npm add -g @google/gemini-cli@latest
# npm add -g task-master-ai
npm add -g groq-code-cli@latest & npm add -g @sourcegraph/amp & npm add -g @qwen-code/qwen-code@latest & npm add -g @kilocode/cli
claude mcp add chrome-devtools -s user npx chrome-devtools-mcp@latest
claude mcp add -t http 1mcp "http://127.0.0.1:3050/mcp?app=claude-code"
qwen mcp add chrome-devtools -s user npx chrome-devtools-mcp@latest
qwen mcp add -t http 1mcp "http://127.0.0.1:3050/mcp?app=claude-code"
# gemini mcp add -t http 1mcp "http://127.0.0.1:3050/mcp?app=gemini"
# gemini mcp add chrome-devtools -s user npx chrome-devtools-mcp@lates
gemini mcp add -s user chrome-devtools npx chrome-devtools-mcp@latest
amp mcp add chrome-devtools -s user -- npx chrome-devtools-mcp@latest

curl -sSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
  | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
  && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
  | sudo tee /etc/apt/sources.list.d/ngrok.list \
  && sudo apt update \
  && sudo apt install ngrok


