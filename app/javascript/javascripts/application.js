(() => {
  const checkBoxList = document.querySelectorAll('.disabled-checkbox')
  const imageList = document.querySelectorAll('.image')

  imageList.forEach((image, i) => {
    image.addEventListener('click', () => {
      const imageClassList = image.classList

      // checked属性の切り替え
      checkBoxList[i].checked = !checkBoxList[i].checked

      // CSSクラスの切り替え
      if (Array.from(imageClassList).includes('checked')) {
        imageClassList.remove('checked')
      } else {
        imageClassList.add('checked')
      }
    })
  })
})()
