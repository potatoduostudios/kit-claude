# 🧹 Como o Zelador trabalha

O Zelador é um chat do Claude Code (app desktop) que organiza a barra lateral e repassa pedidos para os chats dos projetos.
Para montar o seu, cole o texto de `PROMPT-ORGANIZACAO.md` num chat novo.

Chat: "🧹 ZELADOR (limpeza e organização da barra lateral)", sozinho no grupo "🧹 Zelador".
Ajudantes: só 2 Haiku 5.5 (esforço máximo), que nunca criam subagentes:
- Inspetor (só lê): diz se um chat está terminado, esperando você, trabalhando ou cortado no meio.
- Arquivista: escreve resumos e guarda backups em `_ZELADOR/`.

## Regras
- Cada projeto tem CHAT PRINCIPAL em MAIÚSCULAS (nunca arquivar). Chats novos saem do principal (ficam pendurados nele). Chat solto: avisar.
- Visíveis por projeto: principal, último terminado, os rodando e os com ⏳. Arquivar só "folhas" e conferir depois. Nunca desarquivar o que VOCÊ arquivou.
- ⏳ só quando o chat espera você; tirar ⏳ velho na ronda.
- O Zelador é a central: você pede aqui, ele repassa aos principais (SendMessage, achando o id na hora com list_sessions), um pedido por vez.
- Contexto cheio: abrir um Zelador novo com um arquivo de handoff.

## Ronda (a cada 2 horas)
1. `list_sessions` (limit 100) e `list_groups`.
2. Em cada grupo/projeto:
   - Nunca arquivar: chat rodando, chat esperando você (⏳ ou pergunta aberta), chat principal e o ÚLTIMO chat usado do projeto.
   - Arquivar só os parados, terminados e repetidos. Na dúvida, perguntar ao Inspetor; se ainda tiver dúvida, perguntar a você.
3. Antes de arquivar: `export_transcript` e guardar o zip em `_ZELADOR/backups/<data>_<nome>.zip`; anotar a linha em `REGISTRO.md`.
4. Depois de arquivar: conferir com `list_sessions include_archived` se nada que devia ficar foi junto (arquivar leva os chats-filhos parados). Desarquivar o que foi errado.
5. Chat novo fora do grupo do projeto: mover para o grupo certo.
6. Limite: 6 backups por hora; o resto fica pra próxima ronda.

## Agendamento
- Ronda com CronCreate `"17 */2 * * *"`. Ela expira em 7 dias: deixar uma tarefa única no 6º dia pra recriar.
- As tarefas morrem se o chat do Zelador for arquivado.
