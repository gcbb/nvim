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
echo "                    �汾: 2.1.0-dev    ���Ĺ���: https://spacevim.org/cn/     "

Push-Location ~

$app_name    = "gVim"
$repo_url    = "git@gitee.com:gcbb/vim.git"
$repo_name   = "gVim"
$repo_path   = "$HOME\gVim"


Function Pause ($Message = "�밴���ⰴ������ . . . ") {
  if ((Test-Path variable:psISE) -and $psISE) {
    $Shell = New-Object -ComObject "WScript.Shell"
      $Button = $Shell.Popup("Click OK to continue.", 0, "Script Paused", 0)
  } else {     
    Write-Host -NoNewline $Message
      [void][System.Console]::ReadKey($true)
      Write-Host
  }
}

echo "==> ��ʼ��⻷������..."
echo ""
sleep 1


echo "==> ���� git ����"
if (Get-Command "git" -ErrorAction SilentlyContinue) {
  git version
  echo "[OK] ���Գɹ�. ��ʼ��һ������..."
  sleep 1
} else {
  echo ""
  echo "[ERROR] �޷������ PATH �з��� 'git.exe' ����"
  echo ">>> ׼���˳�......"
  Pause
  exit
}

echo ""

echo "==> ���� vim ����"
if (Get-Command "vim" -ErrorAction SilentlyContinue) {
  echo ($(vim --version) -split '\n')[0]
  echo "[OK] ���Գɹ�. ��ʼ��һ������..."
  sleep 1
} else {
  echo "[WARNING] �޷������ PATH �з��� 'vim' ����. ���Կɼ�����װ..."
  echo ""
  echo "[WARNING] �������װ vim ������ȷ������� PATH! "
}

echo "==> ���� nvim ����"
if (Get-Command "nvim" -ErrorAction SilentlyContinue) {
  echo ($(nvim --version) -split '\n')[0]
  echo "[OK] ���Գɹ�. ��ʼ��һ������..."
  sleep 1
} else {
  echo "[WARNING] �޷������ PATH �з��� 'nvim' ����. ���Կɼ�����װ..."
  echo ""
  echo "[WARNING] �������װ Neovim ������ȷ������� PATH! " 
  Pause 
}

echo "<== ����������������. ������һ��..."
sleep 1
echo ""
echo ""

if (!(Test-Path "$repo_path")) {
  echo "==> ���ڰ�װ $app_name"
  git clone $repo_url $repo_path
} else {
  echo "==> ���ڸ��� $repo_path"
  Push-Location $repo_path
  git pull origin master
}

echo ""
if (!(Test-Path "$HOME\vimfiles")) {
  cmd /c mklink /J $HOME\vimfiles $repo_path
  echo "[OK] ��Ϊ vim ��װ $app_name"
  sleep 1
} else {
  echo "[OK] $HOME\vimfiles �Ѵ���"
  sleep 1
}

echo ""
if (!(Test-Path "$HOME\AppData\Local\nvim")) {
  cmd /c mklink /J "$HOME\AppData\Local\nvim" $repo_path

  echo "[OK] ��Ϊ neovim ��װ $app_name"
  sleep 1
} else {
  echo "[OK] $HOME\AppData\Local\nvim �Ѵ���"
  sleep 1
}

echo "��װpacker"
git clone https://gitclone.com/github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"

echo "����pip��װԴ"
pip config set global.index-url https://pypi.mirrors.ustc.edu.cn/simple


echo "1:��װmingw, ѡbase�� �԰�װmakefile" 
echo "2:��װ Cmake" 
pause
echo "5:��װyarn��֧��COC�İ�װ " 
npm install -g yarn
echo "3: ����test(ʾ������)�е�cmakelist��cmakeģ�嵽c����Ŀ¼" 
echo "4: �л���C����buildĿ¼������cmake.bat����Vim ��C�ļ���ת�����ļ��м���" 


echo "5: ��װpip pynvim" 
pip install pynvim

echo ""
echo "��װ�����!"
echo "=============================================================================="
echo "==               �� Vim �� Neovim�����в�������Զ���װ                   =="
echo "=============================================================================="
echo ""
echo "��лVim�������Լ�SpaceVim��"
echo ""

Pause

# vim:set ft=powershell nowrap: 
