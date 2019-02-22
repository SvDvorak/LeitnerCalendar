<template>
    <div class="rootContainer">
        <img class="logo" src="../logo.svg" />
        <h1>Leitner Calendar</h1>
        <review-groups :startDate="selectedDate" />
        <start-date :selectedDate="selectedDate" @date-changed="startDateChanged" />
        <credits />
        <github-reference />
    </div>
</template>

<script lang="ts">
import { Vue, Component, Prop } from "vue-property-decorator";
import ReviewGroupsComponent from "./ReviewGroups.vue";
import StartDateComponent from "./StartDate.vue";
import CreditsComponent from "./Credits.vue";
import GithubReferenceComponent from "./GithubReference.vue";

@Component({
    components: {
        "review-groups": ReviewGroupsComponent,
        "start-date": StartDateComponent,
        "credits": CreditsComponent,
        "github-reference": GithubReferenceComponent,
    }
})
export default class Root extends Vue {
    selectedDate = new Date();

    mounted() {
        if(localStorage.startDate) {
            this.selectedDate = new Date(localStorage.startDate);
        }
    }
    
    startDateChanged(newValue: Date) {
        this.selectedDate = newValue;
        localStorage.startDate = newValue.toISOString();
    }
};
</script>

<style>
body {
    background: #FAFAFA;
    display: flex;
    flex-direction: column;
    align-items: center;
}

.rootContainer {
    display: flex;
    flex-direction: column;
    margin: 3em 0em;
}

.logo {
    align-self: center;
    width: 24em;
}

h1 {
    font-family: Montserrat, Verdana;
    font-size: 3em;
    text-align: center;
    color: #444;
    margin-top: 0.8em;
    margin-bottom: 0.8em;
}

p {
    font-family: Raleway, Verdana;
    text-align: center;
    color: #666;
    margin: 0.5em 0em;
}

input {
    font-family: Raleway, Verdana;
    color: #111;
}
</style>