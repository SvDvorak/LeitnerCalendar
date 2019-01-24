import Vue from "vue";
import ReviewGroupsComponent from "./components/ReviewGroups.vue";
import StartDateComponent from "./components/StartDate.vue";

let vm = new Vue({
    el: "#app",
    template: `
    <div>
        <h1>Leitner Schedule</h1>
        <review-groups-component :startDate="selectedDate" />
        <start-date-component :initialDate="new Date()" @date-changed="startDateChanged" :name="name" />
    </div>
    `,
    data: {
        name: "World",
        test: new Date(),
        selectedDate: new Date()
    },
    methods: {
        startDateChanged: function(newValue: any) {
            this.selectedDate = newValue;
        }
    },
    components: {
        ReviewGroupsComponent,
        StartDateComponent
    }
});