<script>

    // properties
    export let lang;
    export let sample_posts;

    // load constants
    import { SUBDIRECTORY } from '../../constants.json';

    // load components
    import ImageContainer from '../../components/ImageContainer.svelte';

    // load explanatives
    import Lexicon from './explanatives/Lexicon.svelte';
    import PoliticalNetwork from './explanatives/PoliticalNetwork.svelte';
    import Annotation from './explanatives/Annotation.svelte';

</script>

<section>

    <p class="title">Monitoring</p>

    <p>
        We can’t tackle what we don't know or can't measure.
    </p>
    <br>

    <p class="subtitle">
        Procurement
    </p>
    <p>
        Delineate the information ecosystem you intend to influence. Define the narratives you plan to monitor, counter & spread. 
        Partner with in-situ organizations composed of individuals from diverse backgrounds, who follow local news events avidly, 
        use social media, and ideally have experience with data-driven projects. If this expertise is absent in-situ, you will need 
        to conduct interviews with local focus groups. 
    </p>
    <br>
    <br>


    <p class="subtitle">
        Building the Tools
    </p>
    <p>
        Narrative identification is an intensely culturally-grounded and nuanced activity - the facts are that, to find, 
        understand, engage with, and counter, we depend on people who have a deep working knowledge of the culture. The 
        approach we use here involves combining their knowledge and efforts with computational methods. At a high-level, 
        this approach involves highly-interactive work with a dedicated group of in-situ participants. 
    </p>
    <ul>
        <li>
            Account Mapping: Participants are instructed to go on social media and identify influential Twitter accounts, 
            Youtube channels, Telegram, and Facebook public pages/groups probable of disseminating the target narratives. 
            When adding accounts to the list, participants include additional information such as geographical reach, political 
            affiliation and level of partisanship. Moreover, they categorize them – general conversation, media, activists, 
            state-affiliated. Post hoc, participants lay out known connections between accounts.
        </li>


        <PoliticalNetwork/><br>

        <li>
            Lexicon: Participants are asked to list out popular idioms, keywords or expressions that characterize, or are often found,
            in posts containing the target narratives. Multiple non-overlapping lexicons can be used separately to decouple 
            geographies and themes. 
        </li>
        <Lexicon posts={sample_posts}/>
        
        <li>
            Annotation Guide: Participants are tasked with creating a questionnaire composed of yes/no questions that can be used
            to determine if a social media post evokes the target narratives. If we use the "climate change denial" narrative, 
            we could ask "Does the post suggest a lack of consensus in the scientific community?".
        </li>
    </ul>
    <br>
    <p>
        Following these workshops, we have a list of social media accounts, a lexicon, and a questionnaire adapted 
        to the ecosystem. 
    </p>
    <br>
    <br>


    <p class="subtitle">
        Data Collection & Filtering
    </p>
    <p>
        To collect public social media posts, use the official interface provided by each platform (e.g. CrowdTangle, Twitter API, ...). 
        For private posts, browser-based scrapers can be used. However, you will need an account that has infiltrated the desired private 
        Facebook groups, WhatsApp group chats, etc. Rudimentary social engineering can be used to receive an invitation to join from admins. 
        Self-host the image assets contained in the posts because their URLs are ephemeral. 
    </p>
    <ImageContainer caption="Demonstration of a browser-based scraper" alt="scraping using browser extension" src="{SUBDIRECTORY}assets/videos/browser-scraper.gif"/>
    
    <p>
        Hundreds of thousands of social media posts should be expected. Most of it is noise. Finding posts of interest is analogous 
        to finding a “needle in a haystack”, with hay being added relentlessly. To intercept unrelated posts (e.g. sport, fashion, ...) 
        automatic filtering techniques must be implemented. Here are the heuristics used to sift the dataset for posts of interest.
    </p>
    <ul>
        <li>
            <b>Temporal</b>: Only retain documents that are posted within predetermined date & time windows
        </li>

        <li>
            <b>Lexical</b>: Only retain documents that contain at least one word from the lexicon
        </li>

        <li>
            <b>Engagement</b>: Posts that receive low engagement should be ignored
        </li>
    </ul>
    <br>
    <br>


    <p class="subtitle">
        Annotation
    </p>
    <p>
        Create annotation tasks pairing the social media posts enriched for target narratives and the questionnaire 
        developed previously. Speech is subtle and subjective, tasks are sent to in-situ participants to be 
        annotated. Make sure the images are displayed well. Add the hyperlink pointing to the source post as reference. 
        A post can be sent to multiple independent annotators to receive more perspectives and ultimately improve the 
        quality of the annotations. Annotation will incrementally discover posts containing the target narratives.
    </p>
    <br>
    <p>
        This activity should be done through a web app that allows progress tracking. Monitor which annotators are 
        working, not working, how long it is taking them to submit their questionnaires.
    </p>
    <Annotation/>
    <br>
    <br>


    <p class="subtitle">
        Continuous Improvement
    </p>
    <p>
        Once a sizable collection of social media posts of interest has been identified it can be used to evaluate and improve the tools. 
        Here are a few tuning techniques:
    </p>
    <ul>
        <li>
            <b>Lexicon Pruning</b>: Remove words that were rarely found in posts of interest and often found in 
            benign posts – true positives over false positives. 
        </li>
        <li>
            <b>Lexicon Expansion</b>: <a target="_blank" href="https://en.wikipedia.org/wiki/Tf%E2%80%93idf">TF-IDF</a> applied to
            posts of interest against benign posts is used to discover important words. Participants then decide if
            they should be added to the lexicon.
        </li>
        <li>
            <b>Events</b>: Look at temporal dynamics. When do posts of interest spike? After specific events, 
            a few days after events, a specific period of time. Adjust the time/date windows accordingly.
        </li>
        <li>
            <b>Artificial Intelligence</b>: Train and then use a <a href="https://huggingface.co/" target="_blank">language classification model</a> 
            to uncover posts that deserved to be reviewed but did not satisfy the temporal or lexical filters. 
        </li>
    </ul>
    <br>
    <br>


    <p class="subtitle">
        Analysis
    </p>
    <p>
        The reviewed social media posts are analyzed 4 fronts:
    </p>
    <ul>
        <li>
            <b>Belligerents</b>: Look at who is behind the accounts that published the target narratives. Is there a trend given their profile (e.g. political affiliation, partisanship) ?
        </li>
        <li>
            <b>Salient narratives</b>: Participants re-review the posts that have been flagged as containing the 
            target narratives and are asked to identify sub-narratives and communication strategies.
        </li>
        <li>
            <b>Engagement</b>: Disaggregated by social media platforms, look at which posts received the highest engagement. Verify if they 
            were shared by high profile accounts that aren't in your list.
        </li>
        <li>
            <b>Coordination</b>: To investigate the extent to which different accounts demonstrate a propensity for each of the narratives.
            Assess whether two accounts published a message about the same sub-narrative within an arbitrary number of days.
        </li>
    </ul>
    <br>

</section>

<style>

</style>
