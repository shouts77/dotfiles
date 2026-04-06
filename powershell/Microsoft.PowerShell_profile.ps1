function claude {
    Set-Location "C:\Users\HYU\Documents\99_claude_projects"
    & "C:\Users\HYU\.local\bin\claude.exe" @args
}

# PostgreSQL 인코딩 설정
$env:PGCLIENTENCODING = "UTF8"
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
chcp 65001 | Out-Null

# Notepad++ 설정
 Set-Alias notepad++ "C:\Program Files\Notepad++\notepad++.exe"

# 기본 editor 설정
$env:EDITOR = "nvim"

# Obsidian path 이동 설정
function obs_cd {
    Set-Location "C:\Users\HYU\Documents\999_sym\obsidian-memo"
    }

# Claude Code Projects path 이동 설정
function ccp_cd {
    Set-Location "C:\Users\HYU\Documents\99_claude_projects"
    }

# LLM Wiki path 이동 설정
function wiki_cd {
    Set-Location "C:\Users\HYU\Documents\999_sym\obsidian-memo\llm-wiki"
    }

# LLM Wiki Claude Code 실행
function wiki {
    Set-Location "C:\Users\HYU\Documents\999_sym\obsidian-memo\llm-wiki"
    & "C:\Users\HYU\.local\bin\claude.exe" @args
    }

# Set nvim alias
Set-Alias vim nvim


# Set ll alias
function ll { Get-ChildItem -Force }
