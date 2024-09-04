document.getElementById('estadoCaso').addEventListener('change', function() {
      const sentenciaGroup = document.getElementById('sentenciaGroup');
      const fechaCierreGroup = document.getElementById('fechaCierreGroup');
      
      if (this.value === 'cerrado') {
          sentenciaGroup.style.display = 'block';
          fechaCierreGroup.style.display = 'block';
      } else {
          sentenciaGroup.style.display = 'none';
          fechaCierreGroup.style.display = 'none';
      }
    });
    
    document.getElementById('clientForm').addEventListener('submit', function(event) {
      event.preventDefault();
      
      const rut = document.getElementById('rut').value;
      const nombre = document.getElementById('nombre').value; 
      const apellido = document.getElementById('apellido').value;
      const pais = document.getElementById('pais').value;  
      const calle = document.getElementById('calle').value;
      const numeroUbicacion = document.getElementById('numeroUbicacion').value;
      const identificacion = document.getElementById('identificacion').value;
      const email = document.getElementById('email').value;
      const telefono = document.getElementById('telefono').value;
      const codigoPostal = document.getElementById('codigoPostal').value ? document.getElementById('codigoPostal').value : null;
      const numeroCaso = document.getElementById('numeroCaso').value;
      const descripcionCaso = document.getElementById('descripcionCaso').value;
      const fechaInicioCaso = document.getElementById('fechaInicioCaso').value;
      const estadoCaso = document.getElementById('estadoCaso').value;
      const descripcionSentencia = document.getElementById('descripcionSentencia').value;
      const fechaCierreCaso = document.getElementById('fechaCierreCaso').value ? document.getElementById('fechaCierreCaso').value : null;
      
      if (!validateRUT(rut)) {
          alert('RUT inválido. Formato correcto: 12345678-9');
          return;
      }
    
      const formData = {
          rut,
          nombre,
          apellido,
          pais,
          calle,
          numeroUbicacion,
          identificacion,
          email,
          telefono,
          codigoPostal,
          numeroCaso,
          descripcionCaso,
          fechaInicioCaso,
          estadoCaso,
          descripcionSentencia,
          fechaCierreCaso
      };
      
      console.log('Enviando formulario:', formData);

      enviarCliente(formData);
    });
    
    function validateRUT(rut) {
      const regex = /^[0-9]+-[0-9Kk]$/;
      return regex.test(rut);
    }
    
    async function enviarCliente(formData) {
      try {
          const res = await fetch('http://localhost:4000/clientes', {
              method: 'POST',
              headers: {
                  'Content-Type': 'application/json'
              },
              body: JSON.stringify(formData)
          });
    
          if (!res.ok) {
              throw new Error('Error al enviar el cliente');
          }
    
          const resJson = await res.json();
          console.log('Cliente agregado con éxito:', resJson);
          alert('Formulario enviado exitosamente!');
      } catch (error) {
          console.error('Error:', error);
          alert('Hubo un problema al enviar el formulario');
      }
    }
    