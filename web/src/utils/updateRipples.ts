const updateRipples = () => {
  const buttonRipple: any = document.querySelectorAll('#ripple-animation');

  buttonRipple.forEach((button: any) => {
    button.onclick = ({
      pageX,
      pageY,
      currentTarget,
    }: {
      pageX: number;
      pageY: number;
      currentTarget: any;
    }) => {
      let x = pageX - currentTarget.offsetLeft;
      let y = pageY - currentTarget.offsetTop;
      if (currentTarget.classList.contains('center-ripple')) {
        x = currentTarget.offsetWidth / 2;
        y = currentTarget.offsetHeight / 2;
      }
      const ripple = document.createElement('span');
      // make the style of the ripple with the overflow hidden
      ripple.classList.add('ripple-effect');
      ripple.style.left = `${x}px`;
      ripple.style.top = `${y}px`;
      button.appendChild(ripple);
      setTimeout(() => {
        ripple.remove();
      }, 600);
    };
  });
};

export default updateRipples;
