# Kit Claude pra começar

Tudo o que eu uso no dia a dia com o Claude Code, pronto pra você baixar: regras, skills, o método de planejar projetos e o "Zelador" que organiza os chats.

## O que tem aqui

| Pasta / arquivo | O que é |
|---|---|
| `CLAUDE.md` | Regras gerais (economia de tokens, papéis dos modelos, perguntas em caixinhas, quando o Claude deve te chamar, organização dos chats). |
| `skills/projetos-regras` | O método pra qualquer projeto: perguntar antes, planejar, construir, testar e destravar. |
| `skills/grilling` e `skills/grill-me` | O "Grill Me": o Claude te enche de perguntas até o plano ficar redondo. |
| `skills/entender-codigo` | Como entender um código, programa ou formato antes de mexer. |
| `skills/` (o resto) | Skills de mod de jogos: recon, engenharia reversa, port de mod, assets, automação, vídeo e publicação (do projeto universal-modder, licença MIT). |
| `zelador/` | Como montar o chat 🧹 ZELADOR, que organiza a barra lateral e repassa pedidos pros projetos. |
| `ferramentas/ver-espaco` | Script que só mostra o que está ocupando o disco no Windows (não apaga nada). |

## Como os modelos trabalham

- **Opus 5.5**: planeja. Analisa o projeto e faz as perguntas com o Grill Me. Também entra quando algo trava feio.
- **Sonnet 5.5** (esforço médio): é o líder, comanda a operação e constrói.
- **Haiku 5.5** (esforço máximo): lê código, faz as tarefas simples, revisa e diagnostica erro.

A ideia é sempre gastar o mínimo de tokens: o modelo mais barato que dá conta.

## Como instalar (Windows)

1. Instale o Claude Code (app desktop ou terminal).
2. Baixe este repositório (botão verde **Code > Download ZIP**) e descompacte.
3. Dê dois cliques em `instalar.bat`. Ele copia as skills para `~/.claude/skills` e, se você ainda não tem um `CLAUDE.md`, copia o nosso.
   - Se você já tem um `CLAUDE.md`, ele não sobrescreve: abra o nosso e copie só o que quiser.
4. Abra o `~/.claude/CLAUDE.md` e troque o que estiver entre `<>` (seu nome, apelido).
5. Reinicie o Claude Code.

No Mac/Linux, copie a pasta `skills/*` para `~/.claude/skills/` e o `CLAUDE.md` para `~/.claude/CLAUDE.md`.

## Primeiros passos

- Projeto novo: diga "quero começar um projeto de ..." e a skill `projetos-regras` entra sozinha.
- Pra afiar um plano: digite `/grill-me`.
- Pra organizar os chats: cole o conteúdo de `zelador/PROMPT-ORGANIZACAO.md` num chat novo.

## Créditos

- Skills de mod de jogos: [universal-modder](https://github.com/rehan-remade/universal-modder) por Rehan e colaboradores (MIT), licença em cada pasta (`LICENSE-universal-modder`).
- Skill `grilling` / `grill-me`: baseada nas skills de Matt Pocock (https://github.com/mattpocock/skills).
