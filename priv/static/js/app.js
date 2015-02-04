var JottoApp = React.createClass({
  getInitialState: function() {
    return {guesses: []};
  },

  handleSubmit: function(e) {
    console.log("submit pressed!");
  },

  render: function() {
    return (
      <form className="pure-form" onSubmit={this.handleSubmit}>
        <input type="text" maxLength="5" placeholder="Enter a 5 letter word" />
        <button className="pure-button pure-button-primary">Guess</button>
      </form>
    );
  }
});

React.render(<JottoApp />, $('.guess-input').get(0));