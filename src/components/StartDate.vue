<template>
    <div class="container">
        <p>Based on a start date of</p>
        <datepicker class="datepicker" :value="selectedDate" v-on:selected="dateChanged" format="d MMMM yyyy"></datepicker>
    </div>
</template>

<script lang="ts">
import { Vue, Component, Prop, Emit } from "vue-property-decorator";
import Datepicker from "vuejs-datepicker";

@Component({
    components: {
        "datepicker": Datepicker
    }
})
export default class StartDate extends Vue {
    @Prop() selectedDate!: Date;

    @Emit()
    dateChanged(selected: Date) {
        return selected;
    }
}
</script>

<style>
.container {
    display: flex;
    flex-direction: row;
    justify-content: center;
}
.datepicker {
    margin-left: 0.5em;
    display: flex;
}
/* No css class on that div, we want it centered like text next to it */
.datepicker div:first-child {
    align-self: center;
}
input {
    border: 0px;
    background: transparent;
    font-family: inherit;
    font-size: inherit;
    font-style: italic;
}
</style>