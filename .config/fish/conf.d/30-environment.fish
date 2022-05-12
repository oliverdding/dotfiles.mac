set -gx SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
set -gx GPG_TTYP (tty)
set -gx PASSWORD_STORE_CHARACTER_SET 'a-zA-Z0-9~!@#$%^&*()-_=+[]{};:,.<>?'
set -gx PASSWORD_STORE_GENERATED_LENGTH '20'
set -gx GOPATH "$HOME/.local/share/go"
set -gx JAVA_HOME '/Library/Java/JavaVirtualMachines/openjdk8-zulu/Contents/Home/'
set -gx KUBECONFIG (echo (ls ~/.kube/config.d/* 2>/dev/null) | sed 's/ /:/g')
