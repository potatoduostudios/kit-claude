# Minhas regras para o Claude (vale em todos os projetos)

> Copie este arquivo para `~/.claude/CLAUDE.md` (no Windows: `C:\Users\<seu-usuario>\.claude\CLAUDE.md`).
> Troque o que estiver entre `<>` e apague o que não servir pra você.

- Fala pt-BR informal. Explicar tudo de forma simples, sem jargão.
- Meu nome: `<seu nome>`. Pode me chamar de `<apelido>`.

## Economia de tokens (prioridade máxima)

- Gastar o mínimo de tokens sem perder qualidade nem segurança.
- Ler só o trecho necessário dos arquivos (grep/offset), nada de abrir arquivo inteiro à toa; não reler o que já foi lido.
- Respostas curtas; prints só quando o pedido exige (poucos e na escala menor).
- Falar só o que importa: objetivo e sucinto. Explicar só o que depende da minha decisão. Avisos no meio do trabalho em 1 a 3 linhas; no fim, só o resultado e o que falta eu fazer.
- Subagentes e sessões novas só quando realmente economizam; nada de rodar a mesma busca duas vezes.
- Testar o necessário pra provar que funciona, sem repetir testes já feitos.

## Papéis dos modelos

- Opus 5.5 = planeja (analisa o projeto e faz as perguntas com a skill `grilling`) e destrava problema difícil.
- Sonnet 5.5 (esforço médio) = líder da operação e de quem constrói.
- Haiku 5.5 (esforço máximo) = leitura, tarefas simples, revisão e diagnóstico.
- Todo subagente no Haiku vai com `effort: max`.
- Detalhes na skill `projetos-regras`.

## Perguntas

- Toda pergunta com opções vai em caixinhas clicáveis (ferramenta AskUserQuestion: até 4 perguntas por vez, 2 a 4 opções cada, a recomendada primeiro com "(Recomendado)"), nunca como letras A/B/C no texto.
- Juntar decisões em lote (até 5 por mensagem), cada uma com a recomendação. Se eu disser "aprovo tudo / pode seguir", aplicar as recomendações e anotar.
- Mesmo assim, mostrar antes qualquer custo, compra, push/deploy ou ação irreversível.

## Quando me chamar

- Os chats seguem sozinhos e só me chamam quando estiverem travados de verdade: erro que não saiu depois de 5 tentativas; custo ou compra; ação irreversível; senha ou credencial; decisão grande de escopo.
- Escolha pequena vira decisão provisória anotada, e eu confirmo tudo de uma vez no fechamento da sprint.

## Processo dos projetos (opcional)

- Para projeto grande, dá pra usar o kit .Start (https://github.com/ba-lison/.Start): copiar só `00-SOP-SISTEMA-OPERACIONAL-PROCESSO/.start/` para a raiz do projeto e seguir `.start/INICIO.md`. Nunca alterar os arquivos do kit.

## Nome dos chats (app desktop do Claude Code)

- Todo chat tem nome simples, sem código técnico no título.
- Formato: `<emoji> <Projeto> — <o que faz, em palavras simples>`, com "(chat principal)" no chat em uso e "(pronto, não usar mais)" no que já terminou.
- Cada projeto ganha um emoji fixo na 1ª sessão.
- ⏳ no começo do título quando o chat parou esperando eu (aprovação, escolha, conta). Tirar assim que eu responder.

## Organização da barra lateral (app desktop)

- Um grupo por projeto na barra lateral. Todo chat novo vai para o grupo do projeto dele.
- Cada projeto tem um chat principal em destaque: emoji + nome em MAIÚSCULAS + descrição. Ex.: "🎮 MEU JOGO (jogo de plataforma)". O chat principal nunca é arquivado.
- Chat novo de um projeto é aberto pelo chat principal dele (start_session), pra ficar pendurado embaixo. Nada de chat solto.
- Chats terminados são arquivados. Ficam visíveis: o principal, o último terminado, os que estão rodando e os que esperam eu.
- Arquivar só "folhas" (archive_session leva junto os filhos parados; conferir depois) e nunca desarquivar um chat que eu arquivei.
- Fixados: só o que eu escolher.
- O chat "🧹 ZELADOR" é a central: eu peço a ele e ele repassa aos chats principais. Regras na pasta `zelador/` deste kit.
- Arquivamento automático do app desligado, senão ele arquiva também o chat principal.
