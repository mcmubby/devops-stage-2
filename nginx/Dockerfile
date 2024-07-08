# Use the official Nginx image from the Docker Hub
FROM nginx:latest

# Copy the custom nginx.conf to the container
COPY nginx.conf /etc/nginx/nginx.conf

# Expose the ports
EXPOSE 3000 8000 4900 80 443 5173 81

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
