# Ubuntu dotfiles

vim 및 vim plugin,  neovim 등 개발 환경 설정 파일 모음입니다.

---

# PowerShell dotfiles

PowerShell Profile, neovim 등 개발 환경 설정 파일 모음입니다.

## 📁 구성

```
dotfiles/
├── init.lua                           # Neovim 설정 파일
└── Microsoft.PowerShell_profile.ps1   # PowerShell 7 프로필
```

---

## ⚙️ Neovim 설정

### 설치 경로

| OS | 경로 |
|----|------|
| Windows | `C:\Users\<사용자명>\AppData\Local\nvim\` |
| macOS / Linux | `~/.config/nvim/` |

### 새 PC에서 설정 적용하기

#### 1. Neovim 설치

```powershell
winget install Neovim.Neovim
```

#### 2. PATH 등록 (필요한 경우)

```powershell
[System.Environment]::SetEnvironmentVariable(
    "PATH",
    $env:PATH + ";C:\Program Files\Neovim\bin",
    "User"
)
```
PowerShell 재시작 후 `nvim` 명령어 확인.

#### 3. dotfiles clone

```powershell
git clone https://github.com/HYU/dotfiles.git "$env:LOCALAPPDATA\nvim"
```

#### 4. 플러그인 설치

```
nvim
:Lazy sync
```

---

## 🔌 플러그인

| 플러그인 | 설명 |
|----------|------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | 플러그인 매니저 |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | 파일 탐색기 사이드바 |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | 파일 아이콘 |

---

## ⌨️ 단축키 (Neovim)

| 단축키 | 기능 |
|--------|------|
| `Space + e` | 파일 탐색기 열기/닫기 |

> 리더 키는 `Space`로 설정되어 있습니다.

---

## 📝 참고 (Neovim)

- 아이콘이 깨져 보이면 [Nerd Font](https://www.nerdfonts.com/) 설치 후 터미널 폰트로 설정
- 플러그인은 `lazy.nvim`이 자동으로 `~/.local/share/nvim/` (또는 Windows의 경우 `%LOCALAPPDATA%\nvim-data\`)에 설치함

---

## ⚙️ PowerShell 설정

### 설치 경로

| OS | 경로 |
|----|------|
| Windows (PS 7) | `C:\Users\<사용자명>\Documents\PowerShell\Microsoft.PowerShell_profile.ps1` |

### 설정 내용

| 항목 | 내용 |
|------|------|
| `claude` 함수 | 프로젝트 폴더로 이동 후 claude.exe 실행 |
| PostgreSQL 인코딩 | `PGCLIENTENCODING=UTF8`, 콘솔 UTF-8 설정 |
| `notepad++` alias | Notepad++ 실행 경로 alias |

### 새 PC에서 설정 적용하기

#### 1. PowerShell 7 설치

```powershell
winget install Microsoft.PowerShell
```

#### 2. 프로필 폴더 생성 및 파일 복사

```powershell
New-Item -ItemType Directory -Path "$HOME\Documents\PowerShell" -Force
Copy-Item "Microsoft.PowerShell_profile.ps1" "$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
```

#### 3. pwsh 재시작 후 확인

```powershell
cat $PROFILE
```
