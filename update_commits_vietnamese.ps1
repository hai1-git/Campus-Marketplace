[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

Set-Location $PSScriptRoot

Write-Host "========================================================" -ForegroundColor Cyan
Write-Host " DANG CHUYEN TOAN BO COMMIT CU SANG TIENG VIET" -ForegroundColor Cyan
Write-Host " Repo: https://github.com/tr-nh-h-i/Campus-Marketplace.git" -ForegroundColor Cyan
Write-Host "========================================================" -ForegroundColor Cyan
Write-Host ""

function Get-UnescapedText([string]$text) {
    return [System.Text.RegularExpressions.Regex]::Unescape($text)
}

# 1. Kiem tra cac commit goc
$c1 = "65c6e95"
$c2 = "5455bf0"
$c3 = "60dc282"

# Lay thong tin tac gia va ngay gio cua tung commit goc
$c1_author = (git log -1 --format="%an" $c1).Trim()
$c1_email  = (git log -1 --format="%ae" $c1).Trim()
$c1_date   = (git log -1 --format="%ad" $c1).Trim()

$c2_author = (git log -1 --format="%an" $c2).Trim()
$c2_email  = (git log -1 --format="%ae" $c2).Trim()
$c2_date   = (git log -1 --format="%ad" $c2).Trim()

$c3_author = (git log -1 --format="%an" $c3).Trim()
$c3_email  = (git log -1 --format="%ae" $c3).Trim()
$c3_date   = (git log -1 --format="%ad" $c3).Trim()

Write-Host "[1/5] Thong tin tac gia tu cac commit goc:" -ForegroundColor Yellow
Write-Host " - Commit 1: $c1_author <$c1_email> ($c1_date)"
Write-Host " - Commit 2: $c2_author <$c2_email> ($c2_date)"
Write-Host " - Commit 3: $c3_author <$c3_email> ($c3_date)"
Write-Host ""

# Thiet lap thong tin cho Commit 1 (Hai - 21/10)
$env:GIT_AUTHOR_NAME = $c1_author
$env:GIT_AUTHOR_EMAIL = $c1_email
$env:GIT_AUTHOR_DATE = $c1_date
$env:GIT_COMMITTER_NAME = $c1_author
$env:GIT_COMMITTER_EMAIL = $c1_email
$env:GIT_COMMITTER_DATE = $c1_date

$msg1 = Get-UnescapedText "feat: kh\u1edfi t\u1ea1o m\u00e3 ngu\u1ed3n d\u1ef1 \u00e1n Campus Marketplace DNTU"
$msg1_path = Join-Path $env:TEMP "git_msg1.txt"
[System.IO.File]::WriteAllText($msg1_path, $msg1, [System.Text.Encoding]::UTF8)
$tree1 = (git log -1 --format="%T" $c1).Trim()
$new_c1 = (git commit-tree $tree1 -F $msg1_path).Trim()
Write-Host "[2/5] Tao Commit 1 Tieng Viet (Hai):" -ForegroundColor Green
Write-Host " -> $msg1 ($new_c1)"

# Thiet lap thong tin cho Commit 2 (Son - 21/10)
$env:GIT_AUTHOR_NAME = $c2_author
$env:GIT_AUTHOR_EMAIL = $c2_email
$env:GIT_AUTHOR_DATE = $c2_date
$env:GIT_COMMITTER_NAME = $c2_author
$env:GIT_COMMITTER_EMAIL = $c2_email
$env:GIT_COMMITTER_DATE = $c2_date

$msg2 = Get-UnescapedText "docs: c\u1eadp nh\u1eadt th\u00f4ng tin nh\u00f3m v\u00e0 t\u00e0i kho\u1ea3n GitHub th\u00e0nh vi\u00ean"
$msg2_path = Join-Path $env:TEMP "git_msg2.txt"
[System.IO.File]::WriteAllText($msg2_path, $msg2, [System.Text.Encoding]::UTF8)
$tree2 = (git log -1 --format="%T" $c2).Trim()
$new_c2 = (git commit-tree $tree2 -p $new_c1 -F $msg2_path).Trim()
Write-Host "[3/5] Tao Commit 2 Tieng Viet (Son):" -ForegroundColor Green
Write-Host " -> $msg2 ($new_c2)"

# Thiet lap thong tin cho Commit 3 (Son - 22/10)
$env:GIT_AUTHOR_NAME = $c3_author
$env:GIT_AUTHOR_EMAIL = $c3_email
$env:GIT_AUTHOR_DATE = $c3_date
$env:GIT_COMMITTER_NAME = $c3_author
$env:GIT_COMMITTER_EMAIL = $c3_email
$env:GIT_COMMITTER_DATE = $c3_date

$msg3 = Get-UnescapedText "feat: thi\u1ebft k\u1ebf b\u1ea3ng m\u00e0u t\u1eadp trung cho giao di\u1ec7n s\u00e1ng v\u00e0 t\u1ed1i"
$msg3_path = Join-Path $env:TEMP "git_msg3.txt"
[System.IO.File]::WriteAllText($msg3_path, $msg3, [System.Text.Encoding]::UTF8)
$tree3 = (git log -1 --format="%T" $c3).Trim()
$new_c3 = (git commit-tree $tree3 -p $new_c2 -F $msg3_path).Trim()
Write-Host "[4/5] Tao Commit 3 Tieng Viet (Son):" -ForegroundColor Green
Write-Host " -> $msg3 ($new_c3)"

# Thiet lap thong tin cho Commit 4 (Hai - 24/10 hom nay)
$env:GIT_AUTHOR_NAME = "hai1-git"
$env:GIT_AUTHOR_EMAIL = "github1hai@gmail.com"
$env:GIT_AUTHOR_DATE = (Get-Date).ToString("yyyy-MM-ddTHH:mm:ss")
$env:GIT_COMMITTER_NAME = "hai1-git"
$env:GIT_COMMITTER_EMAIL = "github1hai@gmail.com"
$env:GIT_COMMITTER_DATE = (Get-Date).ToString("yyyy-MM-ddTHH:mm:ss")

$msg4 = Get-UnescapedText "feat: t\u1ed1i \u01b0u b\u1ed9 ch\u1ecdn atomic v\u00e0 b\u1ed9 l\u1ecdc gi\u1ecf h\u00e0ng Zustand"
$msg4_path = Join-Path $env:TEMP "git_msg4.txt"
[System.IO.File]::WriteAllText($msg4_path, $msg4, [System.Text.Encoding]::UTF8)

# Dong goi toan bo ma nguon hien tai (bao gom index.html cho GitHub Pages)
git add -A
$tree4 = (git write-tree).Trim()
$new_c4 = (git commit-tree $tree4 -p $new_c3 -F $msg4_path).Trim()
Write-Host "[5/5] Tao Commit 4 Tieng Viet (Hai - 24/10):" -ForegroundColor Green
Write-Host " -> $msg4 ($new_c4)"

# Xoa bien moi truong
Remove-Item Env:\GIT_AUTHOR_NAME
Remove-Item Env:\GIT_AUTHOR_EMAIL
Remove-Item Env:\GIT_AUTHOR_DATE
Remove-Item Env:\GIT_COMMITTER_NAME
Remove-Item Env:\GIT_COMMITTER_EMAIL
Remove-Item Env:\GIT_COMMITTER_DATE

# Xoa file temp
Remove-Item $msg1_path -ErrorAction SilentlyContinue
Remove-Item $msg2_path -ErrorAction SilentlyContinue
Remove-Item $msg3_path -ErrorAction SilentlyContinue
Remove-Item $msg4_path -ErrorAction SilentlyContinue

# Cap nhat nhanh main cuc bo
Write-Host ""
Write-Host "Cap nhat nhanh main cuc bo..." -ForegroundColor Yellow
git reset --hard $new_c4

# Day len GitHub bang force push
Write-Host "Dang day lich su moi len GitHub (git push origin main --force)..." -ForegroundColor Yellow
git push origin main --force

Write-Host ""
Write-Host "========================================================" -ForegroundColor Cyan
Write-Host " HOAN TAT! TOAN BO LICH SU COMMIT DA SANG TIENG VIET." -ForegroundColor Green
Write-Host " Kiem tra tai: https://github.com/tr-nh-h-i/Campus-Marketplace/commits/main" -ForegroundColor Cyan
Write-Host "========================================================" -ForegroundColor Cyan
