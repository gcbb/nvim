@PowerShell -ExecutionPolicy Bypass -Command Invoke-Expression $('$args=@(^&{$args} %*);'+[String]::Join(';',(Get-Content '%~f0') -notmatch '^^@PowerShell.*EOF$')) & goto :EOF
echo "        /######                                     /##    /##/##             "
echo "       /##__  ##                                   | ##   | #|__/             "
echo "      | ##  \__/ /######  /######  /####### /######| ##   | ##/##/######/#### "
echo "      |  ###### /##__  ##|____  ##/##_____//##__  #|  ## / ##| #| ##_  ##_  ##"
echo "       \____  #| ##  \ ## /######| ##     | ########\  ## ##/| #| ## \ ## \ ##"
echo "       /##  \ #| ##  | ##/##__  #| ##     | ##_____/ \  ###/ | #| ## | ## | ##"
echo "      |  ######| #######|  ######|  ######|  #######  \  #/  | #| ## | ## | ##"
echo "       \______/| ##____/ \_______/\_______/\_______/   \_/   |__|__/ |__/ |__/"
echo "               | ##                                                           "
echo "               | ##                                                           "
echo "               |__/                                                           "
echo "                    版本: 2.1.0-dev    中文官网: https://spacevim.org/cn/     "

Push-Location ~

$app_name    = "gVim"
$repo_url    = "git@gitee.com:gcbb/vim.git"
$repo_name   = "gVim"
$repo_path   = "$HOME\gVim"


Function Pause ($Message = "请按任意按键继续 . . . ") {
  if ((Test-Path variable:psISE) -and $psISE) {
    $Shell = New-Object -ComObject "WScript.Shell"
      $Button = $Shell.Popup("Click OK to continue.", 0, "Script Paused", 0)
  } else {     
    Write-Host -NoNewline $Message
      [void][System.Console]::ReadKey($true)
      Write-Host
  }
}

echo "==> 开始检测环境依赖..."
echo ""
sleep 1


echo "==> 测试 git 命令"
if (Get-Command "git" -ErrorAction SilentlyContinue) {
  git version
  echo "[OK] 测试成功. 开始下一个测试..."
  sleep 1
} else {
  echo ""
  echo "[ERROR] 无法在你的 PATH 中发现 'git.exe' 命令"
  echo ">>> 准备退出......"
  Pause
  exit
}

echo ""

echo "==> 测试 vim 命令"
if (Get-Command "vim" -ErrorAction SilentlyContinue) {
  echo ($(vim --version) -split '\n')[0]
  echo "[OK] 测试成功. 开始下一个测试..."
  sleep 1
} else {
  echo "[WARNING] 无法在你的 PATH 中发现 'vim' 命令. 但仍可继续安装..."
  echo ""
  echo "[WARNING] 请后续安装 vim 或者正确设置你的 PATH! "
}

echo "==> 测试 nvim 命令"
if (Get-Command "nvim" -ErrorAction SilentlyContinue) {
  echo ($(nvim --version) -split '\n')[0]
  echo "[OK] 测试成功. 开始下一个测试..."
  sleep 1
} else {
  echo "[WARNING] 无法在你的 PATH 中发现 'nvim' 命令. 但仍可继续安装..."
  echo ""
  echo "[WARNING] 请后续安装 Neovim 或者正确设置你的 PATH! " 
  Pause 
}

echo "<== 环境依赖检测已完成. 继续下一步..."
sleep 1
echo ""
echo ""

if (!(Test-Path "$repo_path")) {
  echo "==> 正在安装 $app_name"
  git clone $repo_url $repo_path
} else {
  echo "==> 正在更新 $repo_path"
  Push-Location $repo_path
  git pull origin master
}

echo ""
if (!(Test-Path "$HOME\vimfiles")) {
  cmd /c mklink /J $HOME\vimfiles $repo_path
  echo "[OK] 已为 vim 安装 $app_name"
  sleep 1
} else {
  echo "[OK] $HOME\vimfiles 已存在"
  sleep 1
}

echo ""
if (!(Test-Path "$HOME\AppData\Local\nvim")) {
  cmd /c mklink /J "$HOME\AppData\Local\nvim" $repo_path

  echo "[OK] 已为 neovim 安装 $app_name"
  sleep 1
} else {
  echo "[OK] $HOME\AppData\Local\nvim 已存在"
  sleep 1
}

echo "安装packer"
git clone https://gitclone.com/github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"

echo "配置pip安装源"
pip config set global.index-url https://pypi.mirrors.ustc.edu.cn/simple


echo "1:安装mingw, 选base， 以安装makefile" 
echo "2:安装 Cmake" 
pause
echo "5:安装yarn以支持COC的安装 " 
npm install -g yarn
echo "3: 复制test(示例工程)中的cmakelist、cmake模板到c工程目录" 
echo "4: 切换到C工程build目录下运行cmake.bat生成Vim 的C文件跳转搜索文件夹即可" 


echo "5: 安装pip pynvim" 
pip install pynvim

echo ""
echo "安装已完成!"
echo "=============================================================================="
echo "==               打开 Vim 或 Neovim，所有插件将会自动安装                   =="
echo "=============================================================================="
echo ""
echo "感谢Vim工作者以及SpaceVim！"
echo ""

Pause

# vim:set ft=powershell nowrap: 
