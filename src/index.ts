import Vue from "vue";
import RootComponent from "./components/Root.vue";

let vm = new Vue({
    el: "#app",
    template: `
    <root-component />
    `,
    components: {
        RootComponent,
    }
});