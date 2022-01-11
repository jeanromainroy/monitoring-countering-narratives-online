<script>

    // properties
    export let lang;
    export let dataset;
    export let params;

    // import components
    import Table from '../../../components/Table.svelte';

    // unpack
    const { 
        sources, 
        lexicon, 
        events,
    } = dataset;

    let lexicon_table = lexicon.sort().map(w => [w]);
    lexicon_table.unshift(['Lexicon'])

    // events table
    let events_table = events.map(event => [event['date'], event['title'], event['description']])
    events_table.unshift(['Date', 'Title', 'Description'])

    // political network table
    let political_network_table = [];
    sources.forEach(source => {
        // grab data
        const { name, endpoint } = source;
        Object.keys(endpoint).forEach(platform_name => {
            const { url } = endpoint[platform_name];
            political_network_table.push([name, platform_name, url])
        })
    })
    political_network_table.unshift(['Source', 'Platform', 'Link'])

    const nbr_of_accounts = political_network_table.length - 1;


</script>


<section>

    <p class="title">Ivory Coast</p>
    
    <p>
        Following Ouattara's controversial re-election for a third term, a dozen opposition members were arrested, flare-ups of violence 
        led to 85 deaths & 484 injured, and ten thousands Ivorians fled to neighboring countries – 
        <a target="_blank" href="https://data2.unhcr.org/en/documents/download/82963">UNHCR report</a>. 
        A situation all too reminiscent of the 2010-2011 civil war that claimed roughly 
        <a target="_bank" href="https://www.aljazeera.com/news/2011/12/27/ivory-coast-the-brink-of-civil-war">3,000 lives</a>. 
        Rumors are running rampant and fears that they are feeding the festering inter-communal hate prompted the Ivorian civil society 
        and the international community to intervene.
    </p>
    <br>
    <p>
        In partnership with the <a target="_blank" href="https://www.ndi.org/">National Democratic Institute</a>, 
        <a target="_blank" href="https://www.ned.org/">National Endowment for Democracy</a>, and 
        <a target="_blank" href="http://www.oidh.ci/">Observatoire Ivoirien des droits de l'homme (OIDH)</a> an 
        information monitoring & countering programme was implemented. Due to illiteracy and low social media penetration in areas 
        of interests, the project scope goes beyond the digital domain.
    </p>

    <p class="subtitle">Groundwork</p>
    <p>
        Bongouanou, Daoukro, and Divo – three prefectures which witnessed horrific scenes of violence or acts of sedition. Enumerators 
        were sent to each to interview community leaders, religious figures, local media, and focus groups split by age, ethnicity, and gender. 
        Participants were interrogated about social media, <a target="_blank" href="https://fr.wikipedia.org/wiki/Espace_de_discussion_de_rue">grins</a>, 
        <a target="_blank" href="https://en.wikipedia.org/wiki/Griot">griots</a> & crieurs publiques, "word of mouth" and traditional media 
        (radio, tv, journal). Favored online forums, popular influencers & polemists, dubious narratives, local idioms, and perspectives on 
        recent events were recorded. Moreover, communication channels were established with individuals who displayed shrewdness and leadership 
        during the sessions.
    </p>

    <p class="subtitle">Influential Pages</p>
    <p>
        Interviews surfaced <b>{nbr_of_accounts}</b> Facebook groups, pages and accounts. Some of these are private and require approval of a request 
        to join.
    </p>
    <Table data={political_network_table}/>


    <p class="subtitle">Lexicon</p>
    <p>
        Interviews surfaced <b>{lexicon.length}</b> words and expressions prone to be used in narratives of interest.
    </p>
    <Table data={lexicon_table}/>

    <p class="subtitle">Discussion</p>
    <p>[ in progress ]</p>

</section>


<style>

</style>