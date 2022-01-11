<script>

    // properties
    export let lang;
    export let dataset;
    export let params;

    // unpack
    const { 
        sources, 
        posts, 
        submissions, 
        lexicon, 
        dictionary,
        events, 
        categories, 
        lexicon_table,
        events_table,
        political_network_table,
        nbr_of_accounts,
        min_date,
        max_date,
        belligerents,
        submissions_of_interest
    } = dataset;

    // import components
    import SearchTable from '../../../components/SearchTable.svelte';
    import Table from '../../../components/Table.svelte';
    import Portraits from '../../../components/Portraits.svelte';

    // import dataviz
    import DotMatrixPlot from '../../../dataviz/DotMatrixPlot/DotMatrixPlot.svelte';
    import Heatmap from '../../../dataviz/Heatmap/Heatmap.svelte';

    // dot matrix data
    // const dotmatrix = posts_to_dotmatrix(submissions_of_interest);

</script>


<section>

    <p class="title">Brazil</p>
    
    <p>
        In the wake of shocks, people want answers but facts have yet to emerge. As a result, deliberate and spontaneous falsehoods 
        can proliferate with incredible velocity. Forums, digital and non-digital, become a capharnaum. In charge of managing the 
        response to the shock, the State and institutions can take steps to inform and guide a concerned public. Opportunistic leaders 
        can leverage their position for power consolidation. They overlook, condone, or amplify false information to undermine the 
        integrity of the information space for their own political advantage. In extremis, they employ propaganda to manipulate 
        public opinion.
    </p>
    <br>
    <p>
        In this study, undertaken in partnership with the <a target="_blank" href="https://www.ndi.org/">National Democratic Institute</a>
        and <a target="_blank" href="https://www.internetlab.org.br/en/">InternetLab</a> we seek to establish the prevalence 
        and nature of disinformation campaigns throughout of the COVID pandemic.
    </p>

    <p class="subtitle">Political Network</p>
    <p>
        In-country participants identified <b>{nbr_of_accounts}</b> Telegram, Facebook, Twitter and Youtube accounts as being part of 
        the political network.
    </p>
    <Table data={political_network_table}/>


    <p class="subtitle">Dataset</p>
    <p>
        Data collection returned a total of <b>{posts.length.toLocaleString()}</b> posts between {min_date} and {max_date}.
    </p>
    <br>
    <p>
        This search bar allows you to find social media posts based on space-separated keywords (click for full results). 
        Some keywords have been removed if they either had low or high occurrence.
    </p>
    <br>
    <p style="font-style: italic;">
        Some posts might have been taken down by the author or the platform since this data collection activity.
    </p>
    <SearchTable placeholders={params['examples']['queries']} documents={posts} word_mapping={dictionary}/>



    <p class="subtitle">Filtering</p>
    <p class="subsubtitle">Lexicon</p>
    <p>
        Participants came up with a list of <b>{lexicon.length} words</b> prone to be used in disinformation. Only posts containing at least
        one of these keywords were kept. 
    </p>
    <Table data={lexicon_table}/>

    <p class="subsubtitle">Events</p>
    <p>
        The shock timeline developed by the participants is composed of {events.length} key events. We only considered social media posts 
        published during the 21 days following each event. 
    </p>
    <Table data={events_table}/>


    <p class="subsubtitle">Engagement</p>
    <p>
        Post that did not meet the minimum engagement thresholds were dismissed.
    </p>
    <Table data={[
        ["Type", "Minimum Value"],
        ["Views", "30000"],
        ["Reactions", "800"],
        ["Comments", "150"],
        ["Shares", "50"]
    ]}/>

    <p class="subtitle">Results</p>

    <p>
        Using automated lexical, temporal and engagement filters, in combination with human reviews we uncovered a total of 
        <b>{submissions_of_interest.length}</b> posts containing disinformation from <b>{belligerents.length}</b> belligerents.
    </p>
    <br>

    <Heatmap data={submissions_of_interest} sources={belligerents} events={events}/>
    
    <p class="subsubtitle">Belligerents</p>
    <p>
        Here is a short description of the <b>{belligerents.length.toLocaleString()} state-affiliated accounts</b> that published 
        disinformation.
    </p>
    <br>
    <Portraits data={belligerents}/>


    <p class="subtitle">Discussion</p>
    <p>
        [ in progress ]
    </p>

    <!-- <p>
        Each post is represented as a square. The color intensity is proportional to the level of engagement.
    </p>
    <br>
    {#each ['twitter', 'facebook', 'youtube', 'telegram'] as platform_type, i}
        <DotMatrixPlot 
            data={dotmatrix.filter(d => d['source_type'] === platform_type)} 
            title={`${romanize(i+1)}. ${platform_type}`} 
            max_interactions={Math.max(...dotmatrix.filter(d => d['source_type'] === platform_type).map(d => +d['interactions']['count']))}/>
    {/each} -->
    

    <!-- {#each belligerents as belligerent, i}
        <DotMatrixPlot 
            data={dotmatrix.filter(d => d['source_name'] === belligerent['name'])} 
            title={`${romanize(i+1)}. ${belligerent['name']}`} 
            max_interactions={Math.max(...dotmatrix.filter(d => d['source_name'] === belligerent['name']).map(d => +d['interactions']['count']))}/>
    {/each} -->



    <!-- <Results sources={sources} submissions={submissions} events={events} categories={categories} dictionary={dictionary} lexicon={lexicon}/> -->


</section>


<style>

</style>