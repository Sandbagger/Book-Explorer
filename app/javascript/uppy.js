import Uppy from '@uppy/core'
import AwsS3 from '@uppy/aws-s3'

export function uppyInstance({ id, types, server }) {
  const uppy = new Uppy({
    id: id,
    autoProceed: true,
    // restrictions: {
    //   allowedFileTypes: types,
    // },
    
  })
    uppy.use(AwsS3, {
      companionUrl: '/', // will call Shrine's presign endpoint mounted on `/s3/params`
    })


  return uppy
}

export function uploadedFileData(file, response, server) {
  const id = file.meta['key'].match(/^cache\/(.+)/)[1]; // object key without prefix
  return JSON.stringify(fileData(file, id))
}

// constructs uploaded file data in the format that Shrine expects
function fileData(file, id) {
  return {
    id: id,
    storage: 'cache',
    metadata: {
      size:      file.size,
      filename:  file.name,
      mime_type: file.type,
    }
  }
}