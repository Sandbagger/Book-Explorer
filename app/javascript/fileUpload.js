// app/javascript/fileUpload.js

import '@uppy/core/dist/style.css'
import '@uppy/drag-drop/dist/style.css'


import Uppy from '@uppy/core'
import AwsS3 from '@uppy/aws-s3'
import FileInput from '@uppy/file-input'
import DragDrop from '@uppy/drag-drop'

function fileUpload(fileInput) {
  console.log('fileInput', fileInput)  
  const hiddenInput = document.querySelector('.upload-data'),
        formGroup = fileInput.parentNode
   
  // remove default input and use Uppy's
  // formGroup.removeChild('.my-file-input')

  const uppy = new Uppy({
      autoProceed: true,
    })
    // .use(FileInput, {
    //   target: formGroup,
    //   pretty: true,
    // })
    .use(DragDrop, {
      target: formGroup ,
      width: '100%',
      height: '100%',
      note: null,
      locale: {},
    })
    .use(AwsS3, {
      companionUrl: '/', 
    })

  uppy.on('upload-success', (file, response) => {
    console.log('log upload success', file)
    // construct uploaded file data in the format that Shrine expects
    const uploadedFileData = {
      id: file.meta['key'].match(/^cache\/(.+)/)[1], // object key without prefix
      storage: 'cache',
      metadata: {
        size: file.size,
        filename: `${crypto.randomUUID()}-${file.name}`,
        mime_type: file.type,
      }
    }
    console.log('JSON.stringify(uploadedFileData', JSON.stringify(uploadedFileData))
 
    // set hidden field value to the uploaded file data so that it's submitted
    // with the form as the attachment
    hiddenInput.value = JSON.stringify(uploadedFileData)
  })
}

export default fileUpload