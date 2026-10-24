# Nova organização do chat

Cole o texto abaixo num chat novo do Claude Code (app desktop).

---

Quero organizar a barra lateral do Claude Code (app desktop). Configure isto e grave estas regras no meu CLAUDE.md global (~/.claude/CLAUDE.md), na seção "Organização da barra lateral":

1. Um grupo por projeto (ccd_sidebar create_group / move_sessions). Todo chat novo, ao abrir, se põe sozinho no grupo do projeto, escolhido pela pasta (cwd). Um grupo pode juntar vários projetos parecidos.
2. Cada projeto tem um CHAT PRINCIPAL em destaque: emoji + nome em MAIÚSCULAS (ex.: "🎮 MEU JOGO (plataforma)"). Nunca arquivar o principal sem eu pedir.
3. "Pastinha" (regra geral): todo chat novo de um projeto é aberto PELO chat principal (start_session), pra ficar pendurado embaixo dele e abrir/fechar com a setinha. Nunca abrir chat solto de um projeto. Se aparecer um solto, o principal abre um subchat que assume o trabalho dele e o solto é arquivado (não dá pra mudar o "pai" de um chat que já existe).
4. Ampulheta ⏳: só quando o chat está esperando algo de mim (testar, aprovar, decidir, clicar). Pôr "⏳ " no começo do nome do próprio chat + bolinha azul (set_unread). Tirar quando acabar. Se o chat deixou um cartão pra abrir o próximo chat, o chat NOVO, ao começar, tira o ⏳ do chat que o abriu (get_session "self" → parentSessionId → set_session_title).
5. Chats terminados são arquivados. Por projeto ficam visíveis só: o principal, o último chat terminado (pra eu ler o que aconteceu), os que estão rodando e os com ⏳. Arquivar só "folhas" (archive_session leva junto os filhos terminados); depois conferir com list_sessions. Nunca desarquivar um chat que EU arquivei: se precisar do projeto, abrir um chat novo na pasta dele.
6. Fixados (seção lá em cima): só as páginas (artifacts) que eu escolher. Nenhum chat fixa ou desfixa nada sem eu pedir.
7. Um chat "Zelador" (sem projeto, grupo "🧹 Zelador") é a central: eu peço tudo a ele e ele repassa aos chats principais (SendMessage), junta as respostas e me devolve curto e visual. Antes de mandar recado, ele procura o id atual do chat principal com list_sessions (pelo título/grupo, sem arquivados), nunca usa id guardado. Um pedido por vez.
8. O Zelador tem uma rotina de 2 em 2 horas (CronCreate "17 */2 * * *"): põe os chats sem grupo no grupo certo, avisa sobre chat solto, tira ⏳ velho, arquiva os terminados (regra 5), apaga grupo vazio que ninguém pediu e confere os fixados. A rotina expira em 7 dias: deixar uma tarefa única no 6º dia pra recriar. As tarefas morrem se o chat do Zelador for arquivado.
9. Quando o Zelador encher o contexto: ele abre um Zelador novo como subchat, passa um arquivo de handoff (regras, ids, tarefas agendadas), e o novo recria as tarefas, avisa todos os chats principais do id novo e entra no grupo 🧹 Zelador.
10. No app: desligar o arquivamento automático (ele arquivaria também o principal e o último chat). Não fixar chats; o grupo do Zelador fica logo abaixo dos Fixados (arrastar à mão).
11. Normal do app: com o grupo fechado, o chat que está aberto na tela continua aparecendo embaixo do grupo; ele volta pra dentro quando eu abro outro.

Comece listando meus chats (list_sessions) e grupos (list_groups), me mostre a proposta de grupos e de chats principais numa tabela curta, e só mexa depois do meu ok.

IMPORTANTE: não fixe, desfixe, apague nem edite nenhum artifact/fixado que já existe. Mexa só nos chats e grupos deste computador e no CLAUDE.md daqui. Não mexa em arquivo de projeto.
