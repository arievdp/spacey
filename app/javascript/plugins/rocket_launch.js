Vue.component('rocket', {
  template: '#rocket',
  data(){
      return {
        flying: null,
        start: null,
        counting: null,
        countdown: 3,
        space: {}
      }
    },
    methods: {
      launchRocket(){
        this.flying = true;
      },
      initcountdown(){
        const countingdown = setInterval(() => {
          this.countdown--;
          if (this.countdown === 0){
            this.counting = false;
            this.flying = true;
            clearInterval(countingdown);
          }
        }, 1000);
      },
      generateStars(){
        const field = 2;
        const distanceLayer = 3;
        const galaxy = this.$el.getElementsByClassName('galaxy')[0];

        for (let i=0; i<distanceLayer; i++){
          this.$set(this.space, 'field'+i, {});
          for (let j=0; j<field; j++){
            this.$set(this.space['field'+i], 'distance-layer'+j, []);

            for (let k=0; k<10; k++){
              const star = {
                "left": galaxy.clientWidth * Math.random(),
                "top": galaxy.clientHeight / 2 * Math.random()
              };

              this.$set(this.space['field'+i]['distance-layer'+j], k, star);
            }
          }
        }
      }
    },
    mounted(){
      this.$nextTick(function(){
        setTimeout(() => {
          this.counting = true;
          this.initcountdown();
        }, 3500);

        // timeout because even in nextTick the DOM is still not ready..
        setTimeout(() => {
          this.generateStars();
        }, 0)
      });
    }
});

new Vue({
  el: '#app'
});
