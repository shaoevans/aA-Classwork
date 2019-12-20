import React from 'react';

const DAYS = {
  0: "Sun",
  1: "Mon",
  2: "Tue",
  3: "Wed",
  4: "Thur",
  5: "Fri",
  6: "Sat"
};

const MONTHS = {
  0: "Jan",
  1: "Feb",
  2: "Mar",
  3: "Apr",
  4: "May",
  5: "Jun",
  6: "Jul",
  7: "Aug",
  8: "Sep",
  9: "Oct",
  10: "Nov",
  11: "Dec"
};

class ClockComponent extends React.Component {
  constructor(props) {
    super(props);
    this.state = { date: new Date()};
    this.tick = this.tick.bind(this);
  }

  componentDidMount() {
    setInterval(this.tick, 1000);
  }

  // componentWillUnmount() {
  //   this.interval = ;
  // }

  tick() {
    this.setState({ date: new Date()});
  }

  getDay() {
    let day = this.state.date.getDay();
    return DAYS[day];
  }

  getMonth() {
    let month = this.state.date.getMonth();
    return MONTHS[month];
  }

  // getSeconds() {

  // }

  // getMinutes() {
  //       let hour = this.state.date.getHours();
  //   if (hour < 10) {
  //     return `0${hour}`;
  //   } else {
  //     return hour;
  //   }
  // }

  // getHours() {
  //   let hour = this.state.date.getHours();
  //   if (hour < 10) {
  //     return `0${hour}`;
  //   } else {
  //     return hour;
  //   }
  // }

  render() {
    return (
      <div>
        <h1>Clock</h1>
        <div className="clock">
          <p className="timeString">
            <span>
              Time:
            </span>
            <span>
              {this.state.date.getHours()}:{this.state.date.getMinutes()}:{this.state.date.getSeconds()}
            </span>
          </p>
          <p className="timeString">
            <span>
              Date: 
            </span>
            <span>
              {this.getDay()} {this.getMonth()} {this.state.date.getDate()} {this.state.date.getFullYear()} PDT
            </span>
          </p>
        </div>
      </div>
    )
  }
}

export default ClockComponent;