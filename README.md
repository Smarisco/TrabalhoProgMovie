Trabalho para a disciplina de Programação Para Dispositivos Móveis
Alunas: Stela Marisco, Clara Sanabria e Letizia Pereira

WhatsApp usando Flutter

Visão Geral
	O WhatsAppAPP consiste numa reprodução mais simples do WhatsApp, um aplicativo de troca de mensagens entre os usuários. O  aplicativo foi feito na linguagem Dart, usando o framework Flutter e a base de dados Firebase.
  
Papéis
O WhatsAppAPP possui apenas um usuário comum, responsável por administrar a própria conta (enviar mensagens, alterar senha, excluir conversas, editar perfil). Para utilizar o aplicativo, é preciso estar logado na conta, inserindo e-mail e senha e, a partir daí, pode-se iniciar uma conversa com qualquer contato. O objetivo do app é somente a troca de mensagens, tendo como autenticação o login, que é administrado usando o Firebase. 
Instalação

Para rodar a aplicação, é necessário a instalação do SDK do Dart. A seguir vamos mostrar o passo a passo para a instalação:
1 - Abrir o prompt de comando como administrador

2 - Colar a seguinte linha de comando:
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "(iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))) >$null 2>&1" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

3 - Depois de baixado os pacotes e instalado, digitar o seguinte comando para instalar a última versão do Chocolatey:
choco upgrade dart-sdk

4 - Abrir as configurações do Dart

5 - Clicar em “Enable Dart support” e digitar caminho do path onde o Dart foi salvo e depois em “OK”.

Requisitos funcionais:
Logar/deslogar;
Cadastrar/excluir usuário;
Cadastrar/excluir contato;
Enviar/receber mensagens (texto, foto, vídeo);
Configurar perfil (alterar foto, nome);
Listar conversas;
Listar contatos;
Salvar mensagens;
Recuperar mensagens;
Ordenar mensagens;


