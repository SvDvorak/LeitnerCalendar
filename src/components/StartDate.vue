<template>
    <div>
        <p>Based on a start date of <datepicker :value="selectedDate" v-on:selected="dateChanged" format="d MMMM yyyy"></datepicker></p>
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