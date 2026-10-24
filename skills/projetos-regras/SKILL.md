---
name: projetos-regras
description: Regras gerais para qualquer projeto novo (site, app, jogo, bot, canal com IA, automação, extensão, loja, agendamento, chatbot com documentos, curso, mod). Use quando o usuário começar um projeto, pedir um prompt de projeto ou pedir para construir algo do zero.
---

# Regras gerais de projeto

Siga estas regras em qualquer projeto. Elas valem junto com o que o usuário pedir.

## Como conversar
- Português do Brasil, tom informal, simples.
- Respostas curtas, sem resumo longo no fim.
- Explique cada decisão importante em 1 ou 2 frases.

## Perguntas e decisões
- Decisões de produto ou gosto (o que o projeto faz, visual, textos, nomes, o que entra ou não) são do usuário. Pergunte com caixinhas: até 3 opções, a recomendada primeiro com "(Recomendado)", mais "Outro" para o usuário escrever ou falar (ele usa Win + H para ditar).
- Até 5 perguntas por mensagem.
- Se não houver ferramenta de caixinhas, use uma lista numerada com as mesmas opções e espere a resposta.
- Decisões técnicas que não mudam nada para o usuário (nome de variável, pastas, formato de comentário): decida sozinho e liste no fim, uma linha cada.
- Não crie telas, funções, textos ou regras que o usuário não pediu nem aprovou.
- No início, pergunte tudo o que for preciso para começar.
- Durante o trabalho, pergunte só quando a decisão travar o avanço. O que não trava vai para PERGUNTAR-DEPOIS.md, para responder em lote no fim.
- Na fase inicial, pergunte se o projeto terá online (Não, Sim agora ou Depois). "Depois" vai para BACKLOG.md.

## Pesquisa e planejamento
- Antes de construir, pesquise a melhor abordagem para o tipo de projeto.
- Liste os agentes que o projeto precisa, o que cada um faz e por que. Comece com o mínimo.
- Planejamento: Claude Opus 5.5. Analisa o projeto e faz as perguntas com a skill grilling (Grill Me).

## Modelos
- Líder da operação e da construção: Claude Sonnet 5.5, esforço médio.
- Planejamento e problemas difíceis: Claude Opus 5.5.
- Tarefas simples e leitura de código: Claude Haiku 5.5, esforço máximo.
- Revisão de código: um subagente Haiku a cada 5 a 8 arquivos, em paralelo. Projeto pequeno: um basta.
- Economia: use o modelo mais barato que dá conta; Opus só para planejar e destravar.

## Quando algo trava (escada)
1. Haiku diagnostica o erro, só leitura, sem mexer em código.
2. Sonnet conserta, até 4 tentativas com abordagens diferentes. Antes de mexer, confirma o diagnóstico do Haiku.
3. Se o Sonnet não conseguir, Opus 5.5 tenta 1 vez.
4. Se nada der certo, Opus 5.5 analisa e propõe até 3 opções, sem mexer em código. Cada opção traz o que faz, o custo (baixo, médio ou alto), o risco e o modelo que deve aplicar (Sonnet ou Opus), com a recomendada marcada como "(Recomendado)". O usuário escolhe numa caixinha.
5. Se nada der certo, a parte vira pendente.

## Execução sem parar
- Isolamento de falhas: se uma parte trava, ela fica pendente e o resto continua. Nada que já está pronto é refeito por causa de outra falha.
- Fila de tarefas com dependências: sempre pegar a próxima tarefa que não depende de nada pendente.
- Arquivos de controle na raiz do projeto: STATUS.md (fase atual, pronto, pendente, falta), DECISOES.md (cada decisão, com data e se foi aprovada), PERGUNTAR-DEPOIS.md e BACKLOG.md (ideias "para depois").
- Retomada: ao abrir um chat novo no projeto, ler STATUS.md, DECISOES.md e BACKLOG.md e continuar do ponto em que parou, sem perguntar o que fazer.
- Checkpoint ao fim de cada fase: commit local, se o projeto estiver em git. Nunca fazer push sem pedido.

## Qualidade
- Critério de pronto de cada parte no formato "quando eu fizer X, acontece Y".
- Não rodar testes durante a construção. Testes só no fim, escritos por um agente diferente do que escreveu o código.
- Nunca declarar pronto sem mostrar o resultado real dos testes (quantos passaram e quantos falharam).
- Revisão humana antes de pronto: o usuário usa e aprova.
- Protótipo cedo: a primeira versão que funciona vem antes de polir visual e som.

## Segurança e escopo
- Sem segredos no código: chaves e tokens em arquivo de ambiente.
- Dados pessoais só o necessário.
- Lista "fora do escopo" escrita no início, para o projeto não crescer sem controle.
- Antes de qualquer custo, compra, deploy ou cobrança real, pedir confirmação.

## Só para projetos web
- O jogo ou o site precisa abrir com dois cliques no index.html, sem instalar nada e sem servidor. Usar scripts comuns, sem type="module".
