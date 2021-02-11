import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const data_newDate = new Date().toLocaleString({ timeZone: 'Asia/Tokyo' });
    const data_Year = new Date(data_newDate).getFullYear();
    const data_Month = ('0' + (new Date(data_newDate).getMonth() + 1)).slice(-2);
    const data_Day = ('0' + new Date(data_newDate).getDate()).slice(-2);
    const data_Hour = ('0' + new Date(data_newDate).getHours()).slice(-2);
    const data_Minute = ('0' + new Date(data_newDate).getMinutes()).slice(-2);
    const data_Second = ('0' + new Date(data_newDate).getSeconds()).slice(-2);
    const data_Date = data_Year + '年' + data_Month + '月' + data_Day + '日' + ' ' + data_Hour + ':' + data_Minute + ':' + data_Second
    const html = `<tr>
                  <th class="comments-user">${data.content.nickname}</th>
                  <td class="comments-value">${data_Date}<br>${data.content.text}</td>
                  </tr>`;
    const messages = document.getElementById("comments");
    const newMessage = document.getElementById('text-area');
    messages.insertAdjacentHTML('afterbegin', html);
    newMessage.value='';
  }
});
