import Vue from "vue";
import ReviewGroupsComponent from "./components/ReviewGroups.vue";
import StartDateComponent from "./components/StartDate.vue";

let vm = new Vue({
    el: "#app",
    template: `
    <div>
        <h1>Leitner Schedule</h1>
        <review-groups-component :startDate="selectedDate" />
        <start-date-component :selectedDate="selectedDate" @date-changed="startDateChanged" :name="name" />
    </div>
    `,
    data: {
        name: "World",
        selectedDate: new Date()
    },
    mounted() {
        if(localStorage.startDate) {
            this.selectedDate = new Date(localStorage.startDate);
        }
    },
    methods: {
        startDateChanged(newValue: Date) {
            this.selectedDate = newValue;
            localStorage.startDate = newValue.toISOString();
        }
    },
    components: {
        ReviewGroupsComponent,
        StartDateComponent
    }
});