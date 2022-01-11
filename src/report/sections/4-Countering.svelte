<script>

    // properties
    export let lang;

    // load constants
    import { SUBDIRECTORY } from '../../constants.json';

    // load components
    import ImageContainer from '../../components/ImageContainer.svelte';
    import CodeBlock from '../../components/CodeBlock.svelte';

    // load explanatives
    import CampaignPrinciples from './explanatives/CampaignPrinciples.svelte';
    import BoostingPrinciples from './explanatives/BoostingPrinciples.svelte';
    import MediaLandscape from './explanatives/MediaLandscape.svelte';
    import MeasuringEngagement from './explanatives/MeasuringEngagement.svelte';

    // codeblock for link preview campaign
    const link_preview_html = `<!DOCTYPE html>
<html lang="en">
    <head>

        <!-- Title & Description -->
        <meta property="og:title" content="{TITLE}"/>
        <meta property="og:description" content="{DESCRIPTION}"/>

        <!-- Image, must be less than 300kb -->
        <meta property="og:image" content="{IMAGE_URL}">

    </head>
    <body>

        ...

    </body>
</html>`


    // let editor;
    const options = {
        mode: "html",
        lineNumbers: true,
        value: link_preview_html
    }

</script>

<section>

    <p class="title">Countering</p>

    <p>
        Countering narratives can feel like a sisyphean task. Narratives do not have a face, they live in the zeitgeist and 
        trying to censor often leads to the <a href="https://en.wikipedia.org/wiki/Streisand_effect" target="_blank">Streisand effect</a>. 
        Only a holistic approach, requiring the benevolent involvement and collaboration of all stakeholders (i.e. government, media, 
        civil society, activists, population), can lead to a healthy information space. 
    </p>
    <br>

    <p class="subtitle">
        Interventions
    </p>
    <ol>
        <p>
            [ Preventive Care ]
        </p>
        <li>
            Baseline resilience to target narratives is strengthened through promotion of better digital practices (critical thinking, sources verification, ...)
        </li>
        <br>

        <p>
            [ Easing of symptoms ]
        </p>
        <li>
            Addressing the narratives through your own media campaigns. Broadcast content that contains clear calls to actions – viewers should feel 
            compelled to customize, embody and spread the message.
        </li>
        <li>
            Engaging with credible influencers to share the content
        </li>
        <li>
            Social media platforms use a combination of artificial intelligence, human reviews, reports from users and trusted partners to detect and remove 
            fake/inauthentic accounts and hateful narratives. Initiating the process and getting the "trusted" partner status is a worthwhile pursuit, as 
            your findings will be acted on faster. 
        </li>
        

    </ol>
    <ImageContainer caption="<a href='https://www.compra-seguidores.com/' target='_blank'>Company selling bot followers</a>" alt="buying followers" src="{SUBDIRECTORY}assets/images/buying-followers.png"/>
    
    <ol start="5">
        <p>
            [ Curative care ]
        </p>
        <li>
            Punctually and transparently communicate any suspect narratives to all stakeholders
        </li>
        <li>
            Incentive alignment so that every stakeholder equally feels the cost of a toxic information ecosystem 
            and the benefit of productive information ecosystem
        </li>
        <br>

        <p>
            [ Palliative care ]
        </p>
        <li>
            Resources should be deployed to mend affected communities
        </li>
        <li>
            Thought leaders should be held accountable, paired with surgical and temporary banning of accounts
        </li>
    </ol>
    <br>
    <br>


    <p class="subtitle">
        Mass communication
    </p>
    <p>
        As described above, central to fighting narratives is the production of counter media campaigns. 
        Getting a message in front of the masses can be done through many channels.
    </p>
    <MediaLandscape/>
    <p>
        Choosing the adequate channel, or combination of channels, depends on a variety of factors – cost, demographic, 
        reach, targetability, credibility, measurability, complexity, and impact.
    </p>
    <br>
    <br>


    <p class="subtitle">
        Best Practice Principles
    </p>
    <p>
        Four media-agnostic principles should guide the content creation and publishing process of an exemplar campaign.
    </p>
    <CampaignPrinciples/>
    <br>
    <br>


    <p class="subtitle">
        Packaging
    </p>
    <p>
        People click on the packaging not the content. A title, description, and image is your bait. Make it enticing.
    </p>

    <ImageContainer caption="Example of a thumbnail" alt="thumbnail example" src="{SUBDIRECTORY}assets/images/link-preview.png"/>
    

    <!-- <p class="subtitle">
        Anonymity
    </p>
    <p>
        
        
        Signing takes on many forms 
        
        online content can be done in many ways.

        1. Completely transparent. Who is managing the page
        An interesting dynamic emerges when a source is 
        
        The Pseudonym
        Credibility: 
        Anonymity 
    </p>
    <br>
    <br> -->


    <p class="subtitle">
        Boosting
    </p>
    <p>
        Many platforms provide “amplification-as-a-service” to increase the reach of your content. However, 
        it should be used judiciously. The basic rules are outlined below. Step #4 should only occur if high 
        reach is already achieved organically. If it is, set the boosting parameters to target the audience that 
        resonated with the content. 
    </p>
    <BoostingPrinciples/>
    <br>
    <br>


    <p class="subtitle">
        Measuring Engagement
    </p>
    <p>
        Measuring listenership, viewership or readership is media specific. On digital media, the interactions of
        a user with a piece of content can be recorded through a range of descriptive signals.
    </p>
    <MeasuringEngagement/>
    <br>
    <p>
        Social media platforms, where you will distribute your content, provide an additional level of insight 
        into the sentiment of visitors.
    </p>
    <ImageContainer caption="Facebook's Interaction Dashboard" alt="interactions facebook" src="{SUBDIRECTORY}assets/images/interactions.png"/>
    <br>
    <p>
        Furthermore, the flow of visitors should be compartmentalized by dispersing URLs with different query parameters. 
        This strategy allows for counterfactual conjecturing.
    </p>
    <br>
    <div style="text-align: center;">
        <p style="margin-bottom: 4px">https://website.com?source_id=<b class="underline">from-whatsapp</b></p>
        <p style="margin-bottom: 4px">https://website.com?source_id=<b class="underline">from-facebook</b></p>
        <p style="margin-bottom: 4px">https://website.com?source_id=<b class="underline">from-twitter</b></p>
    </div>
    <br>
    <br>

</section>

<style>

</style>
