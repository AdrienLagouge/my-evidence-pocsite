<script context="module">
    export const evidenceInclude = true;
</script>

<script>
    import CustomMapConfig from './CustomMapConfig.svelte';
    import mapJson from './franceMap.json';

    export let mapName = 'France'; // used to define distinct map name for ECharts

    // Map these props to the property names in the JSON file:
    export let nameProperty = 'nom';
    export const abbreviationProperty = undefined;
    export const abbreviations = false;

    export let data;

    // Set names for region and value props:
    export let region;
    export let value;

    export let min = undefined;
	export let max = undefined;

	export let title = undefined;
	export let subtitle = undefined;

	export let link = undefined;

	export let colorScale = undefined;

</script>


<CustomMapConfig 
    {mapJson} 
    {data}
    {mapName} 
    {region} 
    {value}
    {min}
    {max}
    {title}
    {subtitle}
    {link}
    {colorScale}
    {nameProperty}
/>



