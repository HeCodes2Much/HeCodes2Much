require_relative "./cloud_types"

class ReadmeGenerator
  WORD_CLOUD_URL = 'https://raw.githubusercontent.com/TheCynicalTeam/TheCynicalTeam/master/wordcloud/wordcloud.png'
  ADDWORD = 'add'
  SHUFFLECLOUD = 'shuffle'
  INITIAL_COUNT = 3
  USER = "TheCynicalTeam"

  def initialize(octokit:)
    @octokit = octokit
  end

  def generate
    participants = Hash.new(0)
    current_contributors = Hash.new(0)
    current_words_added = INITIAL_COUNT
    total_clouds = CloudTypes::CLOUDLABELS.length
    total_words_added = INITIAL_COUNT * total_clouds

    octokit.issues.each do |issue|
      participants[issue.user.login] += 1
      if issue.title.split('|')[1] != SHUFFLECLOUD && issue.labels.any? { |label| CloudTypes::CLOUDLABELS.include?(label.name) }
        total_words_added += 1
        if issue.labels.any? { |label| label.name == CloudTypes::CLOUDLABELS.last }
          current_words_added += 1
          current_contributors[issue.user.login] += 1
        end
      end
    end

    markdown =
    <<~HTML
      ### Hi there, I'm Wayne - aka [TheCynicalTeam][website] 👋

      [![Website](https://img.shields.io/website?label=github.com/TheCynicalTeam/&color=orange&style=flat-square&url=https://github.com/TheCynicalTeam/)][website]
      [![Twitter Follow](https://img.shields.io/twitter/follow/TheCynicalTeam?color=orange&logo=twitter&style=flat-square)](https://twitter.com/intent/follow?original_referer=https%3A%2F%2Fgithub.com%2FTheCynicalTeam&screen_name=TheCynicalTeam)
      ![Code Time](https://img.shields.io/endpoint?color=orange&style=flat-square&url=https://codetime-api.datreks.com/badge/192?logoColor=white%26project=%26recentMS=0%26showProject=true)


      ### I'm a Boyfriend, Developer, and Teacher!!

      - 🌱 I’m currently learning everything 🤣
      - 👯 I’m looking to collaborate with other content creators
      - 🥅 2020 Goals: Contribute more to Open Source projects
      - ⚡ Fun fact: I love nespresso coffee

      ---
      ### Connect with me:

      [<img align="left" alt="TheCynicalTeam | GitHub" width="50px" src="https://raw.githubusercontent.com/iconic/open-iconic/master/svg/globe.svg" />][website]
      [<img align="left" alt="TheCynicalTeam | Twitter" width="50px" src="https://cdn.jsdelivr.net/npm/simple-icons@v3/icons/twitter.svg" />][twitter]
      [<img align="left" alt="TheCynicalTeam | Twitch" width="50px" src="https://cdn.jsdelivr.net/npm/simple-icons@v3/icons/twitch.svg" />][Twitch]
      [<img align="left" alt="TheCynicalTeam | Instagram" width="50px" src="https://cdn.jsdelivr.net/npm/simple-icons@v3/icons/instagram.svg" />][instagram]

      [website]: https://github.com/TheCynicalTeam/
      [twitter]: https://twitter.com/TheCynicalLiger
      [twitch]: https://twitch.tv/TheCynicalLiger
      [instagram]: https://instagram.com/TheCynicalLiger

      <br />
      <br />
      <br />

      ---
      ### Languages and Tools:

      <img align="left" alt="Visual Studio Code" width="50px" src="https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/visual-studio-code/visual-studio-code.png" />
      <img align="left" alt="Fish" width="50px" src="https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/fish/fish.png" />
      <img align="left" alt="HTML5" width="50px" src="https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/html/html.png" />
      <img align="left" alt="CSS3" width="50px" src="https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/css/css.png" />
      <img align="left" alt="Sass" width="50px" src="https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/sass/sass.png" />
      <img align="left" alt="JavaScript" width="50px" src="https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/javascript/javascript.png" />
      <img align="left" alt="Node.js" width="50px" src="https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/nodejs/nodejs.png" />
      <img align="left" alt="Git" width="50px" src="https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/git/git.png" />
      <img align="left" alt="GitHub" width="50px" src="https://raw.githubusercontent.com/github/explore/78df643247d429f6cc873026c0622819ad797942/topics/github/github.png" />
      <img align="left" alt="Terminal" width="50px" src="https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/terminal/terminal.png" />

      <br />
      <br />
      <br />

      ---

      **GitHub Stats :zap:**

      ![Chart not found](https://github-readme-stats.vercel.app/api?username=TheCynicalTeam&theme=tokyonight&show_icons=true&count_private=true&hide_border=true&include_all_commits=true&custom_title=TheCynicalTeam%27s+GitHub+Stats)

      ---

        <!--START_SECTION:waka-->

        <!--END_SECTION:waka-->

        ---

        **Recent GitHub Activity :zap:**

        <!--START_SECTION:activity-->

        <!--END_SECTION:activity-->

      ---

      A new word cloud will be automatically generated when you [add your own word](https://github.com/TheCynicalTeam/TheCynicalTeam/issues/new?template=addword.md&title=wordcloud%7Cadd%7C%3CINSERT-WORD%3E). The prompt will change frequently, so be sure to come back and check it out :relaxed:

      :star2: Don't like the arrangement of the current word cloud? [Regenerate it](https://github.com/TheCynicalTeam/TheCynicalTeam/issues/new?template=shufflecloud.md&title=wordcloud%7Cshuffle) :game_die:

      <div align="center">

        ## #{CloudTypes::CLOUDPROMPTS.last}

        <img src="#{WORD_CLOUD_URL}" alt="WordCloud" width="100%">

        ![Word Cloud Words Badge](https://img.shields.io/badge/Words%20in%20this%20Cloud-#{current_words_added}-informational?labelColor=7D898B)
        ![Word Cloud Contributors Badge](https://img.shields.io/badge/Contributors%20this%20Cloud-#{current_contributors.size}-blueviolet?labelColor=7D898B)


      HTML

      # TODO: [![Github Badge](https://img.shields.io/badge/-@username-24292e?style=flat&logo=Github&logoColor=white&link=https://github.com/username)](https://github.com/username)

      current_contributors.each do |username, count|
        markdown.concat("[![Github Badge](https://img.shields.io/badge/-@#{format_username(username)}-24292e?style=flat&logo=Github&logoColor=white&link=https://github.com/#{username})](https://github.com/#{username}) ")
      end

      markdown.concat("\n\n Check out the [previous word cloud](#{previous_cloud_url}) to see our community's **#{CloudTypes::CLOUDPROMPTS[-2]}**")

      markdown.concat("</div>")
  end

  private

  def format_username(name)
    name.gsub('-', '--')
  end

  def previous_cloud_url
    url_end = CloudTypes::CLOUDPROMPTS[-2].gsub(' ', '-').gsub(':', '').gsub('?', '').downcase
    "https://github.com/TheCynicalTeam/TheCynicalTeam/blob/master/previous_clouds/previous_clouds.md##{url_end}"
  end

  attr_reader :octokit
end
