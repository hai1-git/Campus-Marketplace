[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

Set-Location $PSScriptRoot

function Get-UnescapedText([string]$text) {
    return [System.Text.RegularExpressions.Regex]::Unescape($text)
}

Write-Host "========================================================" -ForegroundColor Cyan
Write-Host " CAMPUS MARKETPLACE - CONG CU DAY GIT HANG NGAY" -ForegroundColor Cyan
Write-Host " Nguoi thuc hien: Bui Thanh Son (MSSV: 1923050973)" -ForegroundColor Cyan
Write-Host " Tai khoan GitHub: Sonbui12345" -ForegroundColor Cyan
Write-Host " Repo: https://github.com/tr-nh-h-i/Campus-Marketplace.git" -ForegroundColor Cyan
Write-Host "========================================================" -ForegroundColor Cyan
Write-Host ""

git config user.name "Sonbui12345"
git remote set-url origin https://github.com/tr-nh-h-i/Campus-Marketplace.git 2>$null

Write-Host "========================================================" -ForegroundColor Yellow
Write-Host " CHON NOI DUNG COMMIT HANG NGAY (SON - TIENG VIET):" -ForegroundColor Yellow
Write-Host "========================================================" -ForegroundColor Yellow
Write-Host " [1] Ngay 22/10: feat: thiet ke bang mau tap trung cho giao dien sang va toi"
Write-Host " [2] Ngay 23/10: feat: chuan hoa vung cam ung 44x44 va nhan tro nang WCAG"
Write-Host " [3] Ngay 24/10: feat: xu ly 4 trang thai tai trang loading, rong, loi va thu lai"
Write-Host " [4] Ngay 25/10: feat: thiet ke bo loc danh muc va thanh tim kiem san pham"
Write-Host " [5] Ngay 26/10: feat: thiet ke giao dien chi tiet san pham va nut thao tac nguoi mua"
Write-Host " [6] Ngay 27/10: style: hoan thien giao dien cac man hinh va can chinh khoang cach"
Write-Host " [7] Tu go noi dung commit Tieng Viet tuy y"
Write-Host " [0] Thoat"
Write-Host "========================================================" -ForegroundColor Yellow

$choice = Read-Host "Nhap lua chon cua ban [1-7, hoac 0]"

if ($choice -eq "0") { exit }
$msg = ""
switch ($choice) {
    "1" { $msg = Get-UnescapedText "feat: thi\u1ebft k\u1ebf b\u1ea3ng m\u00e0u t\u1eadp trung cho giao di\u1ec7n s\u00e1ng v\u00e0 t\u1ed1i" }
    "2" { $msg = Get-UnescapedText "feat: chu\u1ea9n h\u00f3a v\u00f9ng c\u1ea3m \u1ee9ng 44x44 v\u00e0 nh\u00e3n tr\u1ee3 n\u0103ng WCAG" }
    "3" { $msg = Get-UnescapedText "feat: x\u1eed l\u00fd 4 tr\u1ea1ng th\u00e1i t\u1ea3i trang loading, r\u1ed7ng, l\u1ed7i v\u00e0 th\u1eed l\u1ea1i" }
    "4" { $msg = Get-UnescapedText "feat: thi\u1ebft k\u1ebf b\u1ed9 l\u1ecdc danh m\u1ee5c v\u00e0 thanh t\u00ecm ki\u1ebfm s\u1ea3n ph\u1ea9m" }
    "5" { $msg = Get-UnescapedText "feat: thi\u1ebft k\u1ebf giao di\u1ec7n chi ti\u1ebft s\u1ea3n ph\u1ea9m v\u00e0 n\u00fat thao t\u00e1c ng\u01b0\u1eddng mua" }
    "6" { $msg = Get-UnescapedText "style: ho\u00e0n thi\u1ec7n giao di\u1ec7n c\u00e1c m\u00e0n h\u00ecnh v\u00e0 c\u0103n ch\u1ec9nh kho\u1ea3ng c\u00e1ch" }
    "7" {
        $msg = Read-Host "Nhap noi dung commit (Tieng Viet)"
    }
    default {
        Write-Host "Lua chon khong hop le!" -ForegroundColor Red
        exit
    }
}

if ([string]::IsNullOrWhiteSpace($msg)) {
    Write-Host "Noi dung commit trong!" -ForegroundColor Red
    exit
}

Write-Host ""
Write-Host "[1/3] Dang luu commit vao Git..." -ForegroundColor Green
git add -A

$tempMsg = Join-Path $env:TEMP "git_daily_msg.txt"
[System.IO.File]::WriteAllText($tempMsg, $msg, [System.Text.Encoding]::UTF8)
git commit -F $tempMsg --allow-empty
Remove-Item $tempMsg -ErrorAction SilentlyContinue

Write-Host ""
Write-Host "[2/3] Dang dong bo commit moi tu cac ban tren GitHub..." -ForegroundColor Green
git fetch origin main
git merge origin/main -X ours --no-edit

Write-Host ""
Write-Host "[3/3] Dang day len GitHub (git push origin main)..." -ForegroundColor Green
git push origin main

Write-Host ""
Write-Host "========================================================" -ForegroundColor Cyan
Write-Host " HOAN TAT! Commit da duoc day len GitHub thanh cong." -ForegroundColor Green
Write-Host " Kiem tra tai: https://github.com/tr-nh-h-i/Campus-Marketplace/commits/main" -ForegroundColor Cyan
Write-Host "========================================================" -ForegroundColor Cyan
