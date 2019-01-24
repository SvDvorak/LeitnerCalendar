<template>
    <div>
        <h1>Leitner Schedule</h1>
        <review-groups :startDate="selectedDate" />
        <start-date :selectedDate="selectedDate" @date-changed="startDateChanged" />
    </div>
</template>

<script lang="ts">
import { Vue, Component, Prop } from "vue-property-decorator";
import ReviewGroupsComponent from "./ReviewGroups.vue";
import StartDateComponent from "./StartDate.vue";

@Component({
    components: {
        "review-groups": ReviewGroupsComponent,
        "start-date": StartDateComponent
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