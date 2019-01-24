<template>
    <div>
        <p>Based on a start date of <datepicker :value="selectedDate" v-on:selected="dateChanged" format="d MMMM yyyy"></datepicker></p>
    </div>
</template>

<script lang="ts">
import { Vue, Component, Prop } from "vue-property-decorator";
import Datepicker from "vuejs-datepicker";

@Component({
    components: {
        "datepicker": Datepicker
    }
})
export default class StartDate extends Vue {
    @Prop() selectedDate!: Date;

    dateChanged(selected: Date) {
        this.$emit("date-changed", selected);
    }
}
</script>