set -gx PASSWORD_STORE_CHARACTER_SET 'a-zA-Z0-9~!@#$%^&*()-_=+[]{};:,.<>?'
set -gx PASSWORD_STORE_GENERATED_LENGTH '20'
set -gx GOPATH "$HOME/.local/share/go"
set -gx JAVA_HOME '/Library/Java/JavaVirtualMachines/openjdk8-zulu/Contents/Home/'
set -gx KUBECONFIG (echo (ls ~/.kube/config.d/* 2>/dev/null) | sed 's/ /:/g')
set -gx MCFLY_KEY_SCHEME vim
set -gx MCFLY_FUZZY 2
set -gx MCFLY_RESULTS 50
if test (defaults read -g AppleInterfaceStyle 2>/dev/null) != "Dark"
    set -gx MCFLY_LIGHT TRUE
end
